import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_page.dart';
import 'package:totaltest/presentation/screens/homepage/home_page.dart';
import 'package:totaltest/presentation/shared_widgets/auth_builder/auth_builder_view_model.dart';
import 'package:totaltest/presentation/shared_widgets/auth_builder/state/auth_builder_view_state.dart';

class AuthBuilder extends ConsumerStatefulWidget {
  const AuthBuilder({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthBuilder> createState() => _AuthBuilderState();
}

class _AuthBuilderState extends ConsumerState<AuthBuilder> {
  late final StateNotifierProvider<AuthBuilderViewModel, AuthBuilderViewState>
      authBuilderViewModel;

  @override
  void initState() {
    super.initState();
    authBuilderViewModel =
        StateNotifierProvider<AuthBuilderViewModel, AuthBuilderViewState>(
      (ref) {
        AsyncValue<AppUser?> userAsyncValue = ref.watch(appUserProvider);

        return userAsyncValue.maybeWhen(
          data: (user) => AuthBuilderViewModel(user),
          error: (error, stackTrace) => AuthBuilderViewModel(null),
          loading: () => AuthBuilderViewModel(null),
          orElse: () => AuthBuilderViewModel(null),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthBuilderViewState state = ref.watch(authBuilderViewModel);

    return state.when(
      auth: () => const AuthPage(),
      admin: () => const AdminOverview(),
      user: () => const HomePage(),
    );
  }
}
