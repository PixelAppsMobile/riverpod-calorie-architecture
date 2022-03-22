import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/base_view_model.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';
import 'package:totaltest/domain/providers/admin_provider.dart';

final adminOverviewViewModel = ChangeNotifierProvider(
    (ref) => AdminOverviewViewModel(ref.read(adminProvider.notifier)));
mixin AdminOverviewView {}

class AdminOverviewViewModel extends BaseViewModel<AdminOverviewView> {
  AdminOverviewViewModel(this._adminProvider);
  List<UserProfile> users = [];
  final AdminProvider _adminProvider;
  void initialize() async {
    toggleLoadingOn(true);
    notifyListeners();
    await _adminProvider.fetchUsers();
    users = _adminProvider.state!;
    toggleLoadingOn(false);
    notifyListeners();
  }
}
