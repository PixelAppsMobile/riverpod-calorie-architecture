import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/calorie_stat.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/presentation/providers/base_view_change_notifier.dart';
import 'package:totaltest/presentation/providers/admin_provider.dart';

final adminDetailsViewModel = ChangeNotifierProvider(
    (ref) => AdminDetailsViewModel(ref.read(adminProvider.notifier)));

mixin AdminDetailsView {
  Future<void> showAlert(String message);
  Future<void> openBottomSheet(
      FoodEntry entry, String uid, void Function() onPop);
}

class AdminDetailsViewModel extends BaseViewChangeNotifier<AdminDetailsView> {
  late UserProfile _currentUser;
  final AdminProvider _adminProvider;

  late TabController tabController;

  late CalorieStats _stats;

  AdminDetailsViewModel(this._adminProvider);

  UserProfile get currentUser => _currentUser;

  CalorieStats get stats => _stats;

  Future<void> initialise(String uid, TickerProvider vsync) async {
    toggleLoadingOn(true);
    tabController = TabController(length: 2, vsync: vsync);
    tabController.index = 0;
    await _adminProvider.fetchFoodEntriesForUser(uid);
    _currentUser = _adminProvider.getUserByUID(uid);
    getStats();
    toggleLoadingOn(false);
  }

  void getStats() {
    _stats = CalorieStats.fromFoodEntries(_currentUser.foodEntries!);
    notifyListeners();
  }

  Future<void> deleteFoodEntry(FoodEntry entry) async {
    final either =
        await _adminProvider.deleteFoodEntry(entry, _currentUser.userId);
    return either.fold(
      (l) => view!.showAlert(l.title),
      (r) => getStats(),
    );
  }

  Future<void> editFoodEntry(FoodEntry entry) async {
    await view!.openBottomSheet(entry, _currentUser.userId, () {
      getStats();
    });
  }
}
