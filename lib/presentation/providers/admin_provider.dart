import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/repositories/admin/admin_repo.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';

final adminProvider = StateNotifierProvider((ref) =>
    AdminProvider([], ref.read(adminRepo), ref.read(foodConsumptionRepo)));

class AdminProvider extends StateNotifier<List<UserProfile>?> {
  final AdminRepo _repo;
  final FoodConsumptionRepo _foodConsumptionRepo;

  AdminProvider(List<UserProfile>? value, this._repo, this._foodConsumptionRepo)
      : super(value);

  Future<void> fetchUsers() async {
    final result = await _repo.fetchAllUsers();
    state = result;
  }

  UserProfile getUserByUID(String uid) {
    return state!.where((element) => element.userID == uid).toList().first;
  }

  Future<void> fetchFoodEntriesForUser(String uid) async {
    if (state == null) {
      return;
    }
    final index = state!.indexWhere((element) => element.userID == uid);
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
              (element) => element.userID == uid,
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
              (element) => element.userID == uid,
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
