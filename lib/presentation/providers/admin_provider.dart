import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';
import 'package:totaltest/domain/use_cases/admin/get_all_users_use_case.dart';

final adminProvider = StateNotifierProvider(
  (ref) => AdminProvider(
    [],
    ref.read(foodConsumptionRepo),
    ref.read(getAllUsersUseCase),
  ),
);

class AdminProvider extends StateNotifier<List<UserProfile>?> {
  final FoodConsumptionRepo _foodConsumptionRepo;

  final GetAllUsersUseCase _getAllUsersUseCase;

  AdminProvider(
    List<UserProfile>? value,
    this._foodConsumptionRepo,
    this._getAllUsersUseCase,
  ) : super(value);

  Future<void> fetchUsers() async {
    final result = await _getAllUsersUseCase();

    result.fold(
      (l) => null,
      (r) => state = r.map((e) => e).toList().cast<UserProfile>(),
    );
  }

  UserProfile getUserByUID(String uid) {
    return state!.where((element) => element.userId == uid).toList().first;
  }

  Future<void> fetchFoodEntriesForUser(String uid) async {
    if (state == null) {
      return;
    }
    final index = state!.indexWhere((element) => element.userId == uid);
    final foodEntries =
        await _foodConsumptionRepo.getFoodEntries(overrideUid: uid);

    foodEntries.fold(
      (l) {
        print("ERROR: ${l.title}");
        if (index != -1) {
          state![index] = state![index].copyWith(foodEntries: []);
        }
      },
      (r) {
        if (index != -1) {
          state![index] = state![index].copyWith(foodEntries: r);
        }
      },
    );
  }

  Future<Either<AppError, void>> deleteFoodEntry(
      FoodEntry entry, String uid) async {
    final either =
        await _foodConsumptionRepo.deleteFoodEntry(entry, overrideUid: uid);

    return either.fold(
      (l) => Left(l),
      (r) {
        // Update local record
        UserProfile userProfile = state!
            .where(
              (element) => element.userId == uid,
            )
            .first;
        int foodEntryIndex = userProfile.foodEntries!
            .indexWhere((element) => element.documentID == entry.documentID);
        userProfile.foodEntries!.removeAt(foodEntryIndex);

        return Right(r);
      },
    );
  }

  Future<Either<AppError, void>> updateFoodEntry(
      FoodEntry entry, String uid) async {
    final either =
        await _foodConsumptionRepo.updateFoodEntry(entry, overrideUid: uid);
    return either.fold(
      (l) => Left(l),
      (r) {
        // Update local record
        UserProfile userProfile = state!
            .where(
              (element) => element.userId == uid,
            )
            .first;
        int foodEntryIndex = userProfile.foodEntries!
            .indexWhere((element) => element.documentID == entry.documentID);

        userProfile.foodEntries![foodEntryIndex] = entry;

        return Right(r);
      },
    );
  }
}
