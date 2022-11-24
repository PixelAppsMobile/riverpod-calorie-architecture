import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/presentation/providers/admin_provider.dart';
import 'package:totaltest/presentation/providers/base_view_change_notifier.dart';

final adminOverviewViewModel = ChangeNotifierProvider(
    (ref) => AdminOverviewViewModel(ref.read(adminProvider.notifier)));
mixin AdminOverviewView {}

class AdminOverviewViewModel extends BaseViewChangeNotifier<AdminOverviewView> {
  AdminOverviewViewModel(this._adminProvider);
  List<UserProfile> users = [];

  final AdminProvider _adminProvider;

  void initialize() async {
    toggleLoadingOn(true);
    await _adminProvider.fetchUsers();
    users = _adminProvider.state!;
    toggleLoadingOn(false);
    notifyListeners();
  }
}
