import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/providers/admin/admin_provider.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/screens/admin_overview/state/admin_overview_view_state.dart';

class AdminOverviewViewModel extends StateNotifier<AdminOverviewViewState> {
  AdminOverviewViewModel(this._adminProvider, this._appUserProvider)
      : super(const AdminOverviewViewState.init()) {
    _initialize();
  }
  List<UserProfile> users = [];

  final AdminProvider _adminProvider;
  final AppUserProvider _appUserProvider;

  void _initialize() async {
    state = const AdminOverviewViewState.loading();

    final result = await _adminProvider.fetchUsers();

    result.fold(
      (l) => state = AdminOverviewViewState.error(l.title),
      (r) => state = AdminOverviewViewState.ready(_adminProvider.state!),
    );
  }

  Future<void> logOut() => _appUserProvider.signOut();
}
