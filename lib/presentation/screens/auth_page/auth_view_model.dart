import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/auth_page/state/auth_page_view_state.dart';

class AuthViewModel extends StateNotifier<AuthPageViewState> {
  final TextEditingController controller = TextEditingController();
  final UserProvider _userProvider;

  AuthViewModel(this._userProvider) : super(const AuthPageViewState.ready());

  Future loginUsingToken() async {
    state = const AuthPageViewState.loading();

    final _result = await _userProvider.signIn(controller.text);
    _result.fold(
      (l) {
        state = AuthPageViewState.error(l.title);
      },
      (r) {
        state = const AuthPageViewState.ready();
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
