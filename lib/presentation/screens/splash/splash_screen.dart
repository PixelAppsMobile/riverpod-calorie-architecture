import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_page.dart';
import 'package:totaltest/presentation/screens/homepage/homepage.dart';
import 'package:totaltest/presentation/screens/splash/splash_view_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(splashScreenViewModel.notifier).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(splashScreenViewModel);

    if (loading) {
      return const Scaffold(
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
      );
    }

    final appUser = ref.watch(userProvider);

    if (appUser == null) {
      return const AuthPage();
    } else {
      if (appUser.role == UserRole.admin) return const AdminOverview();
      return const HomePage();
    }
  }
}
