import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/use_cases/admin/get_all_users_use_case.dart';
import 'package:totaltest/domain/use_cases/food_consumption/delete_food_entry_of_user_use_case.dart';
import 'package:totaltest/domain/use_cases/food_consumption/get_food_entries_of_user_use_case.dart';
import 'package:totaltest/domain/use_cases/food_consumption/update_food_entry_of_user_use_case.dart';

final adminProvider = StateNotifierProvider(
  (ref) => AdminProvider(
    [],
    ref.read(getAllUsersUseCase),
    ref.read(getFoodEntriesOfUseCase),
    ref.read(deleteFoodEntryOfUserUseCase),
    ref.read(updateFoodEntryOfUserUseCase),
  ),
);

class AdminProvider extends StateNotifier<List<UserProfile>?> {
  final GetAllUsersUseCase _getAllUsersUseCase;
  final GetFoodEntriesOfUseCase _getFoodEntriesOfUseCase;
  final DeleteFoodEntryOfUserUseCase _deleteFoodEntryOfUserUseCase;
  final UpdateFoodEntryOfUserUseCase _updateFoodEntryOfUserUseCase;

  AdminProvider(
    List<UserProfile>? value,
    this._getAllUsersUseCase,
    this._getFoodEntriesOfUseCase,
    this._deleteFoodEntryOfUserUseCase,
    this._updateFoodEntryOfUserUseCase,
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
    final foodEntries = await _getFoodEntriesOfUseCase(uid);

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
    final either = await _deleteFoodEntryOfUserUseCase(
      DeleteFoodEntryOfUserUseCaseParam(
        documentId: entry.documentId!,
        uid: uid,
      ),
    );

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
            .indexWhere((element) => element.documentId == entry.documentId);
        userProfile.foodEntries!.removeAt(foodEntryIndex);

        return Right(r);
      },
    );
  }

  Future<Either<AppError, void>> updateFoodEntry(
      FoodEntry entry, String uid) async {
    final either = await _updateFoodEntryOfUserUseCase(
      UpdateFoodEntryOfUserUseCaseParam(
        foodEntry: entry,
        uid: uid,
      ),
    );
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
            .indexWhere((element) => element.documentId == entry.documentId);

        userProfile.foodEntries![foodEntryIndex] = entry;

        return Right(r);
      },
    );
  }
}
