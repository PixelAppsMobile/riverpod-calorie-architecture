import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/base_view_model.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';
import 'package:totaltest/domain/providers/admin_provider.dart';

final adminDetailsViewModel = ChangeNotifierProvider(
    (ref) => AdminDetailsViewModel(ref.read(adminProvider.notifier)));

mixin AdminDetailsView {
  Future<void> showAlert(String message);
  Future<void> openBottomSheet(
      FoodEntry entry, String uid, void Function() onPop);
}

class AdminDetailsViewModel extends BaseViewModel<AdminDetailsView> {
  late UserProfile _currentUser;
  final AdminProvider _adminProvider;

  late TabController tabController;

  AdminDetailsViewModel(this._adminProvider);

  UserProfile get currentUser => _currentUser;

  Future<void> initialise(String uid, TickerProvider vsync) async {
    toggleLoadingOn(true);
    tabController = TabController(length: 2, vsync: vsync);
    tabController.index = 0;
    await _adminProvider.fetchFoodEntriesForUser(uid);
    _currentUser = _adminProvider.getUserByUID(uid);
    toggleLoadingOn(false);
  }

  Future<void> deleteFoodEntry(FoodEntry entry) async {
    final either =
        await _adminProvider.deleteFoodEntry(entry, _currentUser.userID);
    return either.fold(
      (l) => view!.showAlert(l.title),
      (r) => r,
    );
  }

  Future<void> editFoodEntry(FoodEntry entry) async {
    await view!.openBottomSheet(entry, _currentUser.userID, () {
      notifyListeners();
    });
  }
}
