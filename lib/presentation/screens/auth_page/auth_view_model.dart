import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/base_view_model.dart';
import 'package:totaltest/domain/providers/user_provider.dart';

mixin AuthView {
  void showSnackbar(String message, {Color? color});
}

final authViewModel = ChangeNotifierProvider.autoDispose(
    (ref) => AuthViewModel(ref.read(userProvider.notifier)));

class AuthViewModel extends BaseViewModel<AuthView> {
  final TextEditingController controller = TextEditingController();
  final UserProvider _authRepo;
  AuthViewModel(this._authRepo);
  Future loginUsingToken() async {
    print(controller.text);
    final _result = await _authRepo.signIn(controller.text);
    _result.fold((l) {
      ///TODO: handle Error
    }, (r) {
      ///TODO: Handle Success
    });
  }
}
