import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/data/repo/admin_repo/admin_repo.dart';
import 'package:totaltest/data/repo/food_consumption_repo/food_consumption_repo.dart';
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

  Future<void> fetchFoodEntriesForUser(UserProfile user) async {
    final index = state!.indexWhere((element) => element.userID == user.userID);
    final foodEntries =
        await _foodConsumptionRepo.getFoodEntries(overrideUid: user.userID);

    if (index != -1) {
      state![index] = state![index].copyWith(foodEntries: foodEntries);
    }
  }
}
