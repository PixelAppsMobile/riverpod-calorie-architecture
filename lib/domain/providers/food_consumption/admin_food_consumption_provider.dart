import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/providers/admin/admin_provider.dart';
import 'package:totaltest/domain/use_cases/food_consumption/delete_food_entry_of_user_use_case.dart';
import 'package:totaltest/domain/use_cases/food_consumption/get_food_entries_of_user_use_case.dart';
import 'package:totaltest/domain/use_cases/food_consumption/update_food_entry_of_user_use_case.dart';

final adminFoodConsumptionProvider = Provider(
  (ref) => AdminFoodConsumptionProvider(
    ref.read(adminProvider.notifier),
    ref.read(getFoodEntriesOfUseCase),
    ref.read(deleteFoodEntryOfUserUseCase),
    ref.read(updateFoodEntryOfUserUseCase),
  ),
);

class AdminFoodConsumptionProvider {
  final AdminProvider _adminProvider;

  final GetFoodEntriesOfUseCase _getFoodEntriesOfUseCase;
  final DeleteFoodEntryOfUserUseCase _deleteFoodEntryOfUserUseCase;
  final UpdateFoodEntryOfUserUseCase _updateFoodEntryOfUserUseCase;

  AdminFoodConsumptionProvider(
    this._adminProvider,
    this._getFoodEntriesOfUseCase,
    this._deleteFoodEntryOfUserUseCase,
    this._updateFoodEntryOfUserUseCase,
  );

  Future<Either<AppError, AppSuccess>> fetchFoodEntriesForUser(
      String uid) async {
    UserProfile userProfile = _adminProvider.getUserByUID(uid);
    final result = await _getFoodEntriesOfUseCase(uid);

    return result.fold(
      (l) => Left(l),
      (r) {
        UserProfile newUserProfile = userProfile.copyWith(foodEntries: r);
        _adminProvider.updateUserProfile(newUserProfile);

        return Right(AppSuccess());
      },
    );
  }

  Future<Either<AppError, AppSuccess>> deleteFoodEntry(
    FoodEntry entry,
    String uid,
  ) async {
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
        UserProfile userProfile = _adminProvider.getUserByUID(uid);

        int foodEntryIndex = userProfile.foodEntries!
            .indexWhere((element) => element.documentId == entry.documentId);

        List<FoodEntry> newFoodEntries = userProfile.foodEntries!;

        newFoodEntries.removeAt(foodEntryIndex);

        UserProfile newUserProfile =
            userProfile.copyWith(foodEntries: newFoodEntries);

        _adminProvider.updateUserProfile(newUserProfile);

        return Right(r);
      },
    );
  }

  Future<Either<AppError, AppSuccess>> updateFoodEntry(
    FoodEntry entry,
    String uid,
  ) async {
    final either = await _updateFoodEntryOfUserUseCase(
      UpdateFoodEntryOfUserUseCaseParam(
        foodEntry: entry,
        uid: uid,
      ),
    );
    return either.fold(
      (l) => Left(l),
      (r) {
        UserProfile userProfile = _adminProvider.getUserByUID(uid);

        int foodEntryIndex = userProfile.foodEntries!.indexWhere(
          (element) => element.documentId == entry.documentId,
        );

        List<FoodEntry> newFoodEntries = [...userProfile.foodEntries!];

        newFoodEntries[foodEntryIndex] = entry;

        UserProfile newUserProfile =
            userProfile.copyWith(foodEntries: newFoodEntries);

        _adminProvider.updateUserProfile(newUserProfile);

        return Right(r);
      },
    );
  }
}
