import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/domain/providers/init_services/init_services_provider.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_page.dart';
import 'package:totaltest/presentation/screens/homepage/home_page.dart';
import 'package:totaltest/presentation/screens/splash/splash_page_view_model.dart';
import 'package:totaltest/presentation/screens/splash/state/splash_page_view_state.dart';
import 'package:totaltest/presentation/shared_widgets/auth_builder/auth_builder.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> {
  late final StateNotifierProvider<SplashPageViewModel, SplashPageViewState>
      splashPageViewModel;

  @override
  void initState() {
    super.initState();
    splashPageViewModel =
        StateNotifierProvider<SplashPageViewModel, SplashPageViewState>(
      (ref) => SplashPageViewModel(
        ref.watch(appUserProvider.notifier),
        ref.read(initServicesProvider),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SplashPageViewState state =
        ref.watch<SplashPageViewState>(splashPageViewModel);

    return state.when(
      loading: () => const Scaffold(
        body: Center(
          child: Text(
            "Calories Tracker",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      ready: () => const AuthBuilder(),
    );
  }
}
