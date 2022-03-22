import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_view_model.dart';
import 'package:totaltest/presentation/shared_widgets/buttons.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends ConsumerState<AuthPage> implements AuthView {
  late final AuthViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Authenticate")),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text("Custom token"),
          TextField(
            controller: _viewModel.controller,
          ),
          Buttons.expandedFlatButton(
              _viewModel.controller.text.isEmpty
                  ? null
                  : _viewModel.loginUsingToken,
              "Sign in")
        ]),
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}
