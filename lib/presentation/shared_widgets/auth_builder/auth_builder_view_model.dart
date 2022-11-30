import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/presentation/shared_widgets/auth_builder/state/auth_builder_view_state.dart';

class AuthBuilderViewModel extends StateNotifier<AuthBuilderViewState> {
  final AppUser? user;

  AuthBuilderViewModel(this.user) : super(const AuthBuilderViewState.auth()) {
    if (user != null) {
      if (user!.role == UserRole.admin) {
        state = const AuthBuilderViewState.admin();
      } else if (user!.role == UserRole.normal) {
        state = const AuthBuilderViewState.user();
      }
    }
  }
}
