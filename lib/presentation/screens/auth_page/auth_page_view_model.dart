import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/auth_page/state/auth_page_view_state.dart';

class AuthPageViewModel extends StateNotifier<AuthPageViewState> {
  final TextEditingController _controller = TextEditingController();
  final UserProvider _userProvider;

  AuthPageViewModel(this._userProvider)
      : super(const AuthPageViewState.init()) {
    _controller.addListener(
      () {
        _emitReady();
      },
    );
    _emitReady();
  }

  void _emitReady() {
    state = AuthPageViewState.ready(_controller);
  }

  Future loginUsingToken() async {
    state = const AuthPageViewState.loading();

    final _result = await _userProvider.signIn(_controller.text);
    _result.fold(
      (l) {
        state = AuthPageViewState.error(l.title);
      },
      (r) {
        _emitReady();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
