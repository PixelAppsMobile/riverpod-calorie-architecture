import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/repositories/admin/admin_repo.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

final adminProvider = StateNotifierProvider((ref) =>
    AdminProvider([], ref.read(adminRepo), ref.read(foodConsumptionRepo)));

class AdminProvider extends StateNotifier<List<UserProfile>?> {
  final AdminRepo _repo;
  final FoodConsumptionRepo _foodConsumptionRepo;

  AdminProvider(List<UserProfile>? value, this._repo, this._foodConsumptionRepo)
      : super(value);

  Future<void> fetchUsers() async {
    final result = await _repo.fetchAllUsers();
    state = result.map((e) => e.toEntity).toList().cast<UserProfile>();
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
