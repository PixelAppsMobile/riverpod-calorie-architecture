import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_view_model.dart';
import 'package:totaltest/presentation/screens/auth_page/state/auth_page_view_state.dart';
import 'package:totaltest/presentation/shared_widgets/buttons.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends ConsumerState<AuthPage> {
  late final StateNotifierProvider<AuthViewModel, AuthPageViewState>
      authViewModel;
  late final AuthViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = StateNotifierProvider<AuthViewModel, AuthPageViewState>(
      (ref) => AuthViewModel(
        ref.read(userProvider.notifier),
      ),
    );
    _viewModel = ref.read(authViewModel.notifier);
    _viewModel.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthPageViewState>(
      authViewModel,
      (_, state) => state.whenOrNull(
        error: (error) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        ),
      ),
    );

    AuthPageViewState state = ref.watch(authViewModel);

    return state.when<Widget>(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error) => Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      ),
      ready: () => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text("Authenticate")),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Custom token"),
                  TextField(
                    key: customTokenTextField,
                    controller: _viewModel.controller,
                  ),
                  Buttons.expandedFlatButton(
                    _viewModel.controller.text.isEmpty
                        ? null
                        : _viewModel.loginUsingToken,
                    "Sign in",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const customTokenTextField = ValueKey("customTokenTextField");
