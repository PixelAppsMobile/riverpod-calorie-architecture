import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/base_view_model.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';
import 'package:totaltest/domain/providers/admin_provider.dart';

final adminDetailsViewModel = ChangeNotifierProvider(
    (ref) => AdminDetailsViewModel(ref.read(adminProvider.notifier)));

class AdminDetailsViewModel extends BaseViewModel {
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
}
