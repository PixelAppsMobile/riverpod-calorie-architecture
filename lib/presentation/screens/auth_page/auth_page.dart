import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_page_view_model.dart';
import 'package:totaltest/presentation/screens/auth_page/state/auth_page_view_state.dart';
import 'package:totaltest/presentation/shared_widgets/buttons.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends ConsumerState<AuthPage> {
  late final StateNotifierProvider<AuthPageViewModel, AuthPageViewState>
      authPageViewModel;
  late final AuthPageViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    authPageViewModel =
        StateNotifierProvider<AuthPageViewModel, AuthPageViewState>(
      (ref) => AuthPageViewModel(
        ref.read(userProvider.notifier),
      ),
    );
    _viewModel = ref.read(authPageViewModel.notifier);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthPageViewState>(
      authPageViewModel,
      (_, state) => state.whenOrNull(
        error: (error) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        ),
      ),
    );

    AuthPageViewState state = ref.watch(authPageViewModel);

    return state.when<Widget>(
      init: () => Container(),
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
      ready: (controller) => SafeArea(
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
                    controller: controller,
                  ),
                  Buttons.expandedFlatButton(
                    controller.text.isEmpty ? null : _viewModel.loginUsingToken,
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
