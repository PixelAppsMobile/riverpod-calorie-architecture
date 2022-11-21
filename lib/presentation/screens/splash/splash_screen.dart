import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/admin_overview/admin_overview.dart';
import 'package:totaltest/presentation/screens/auth_page/auth_page.dart';
import 'package:totaltest/presentation/screens/homepage/homepage.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initailize();
  }

  Future<void> initailize() async {
    await ref.read(localStorageDataSource).init();
    print("prefs initialized");
    await ref.read(userProvider.notifier).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final appUser = ref.watch(userProvider);
    if (appUser == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            "Calories Tracker",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
      );
    } else if (appUser.user != null) {
      if (appUser.role == UserRole.admin) return const AdminOverview();
      return const HomePage();
    } else {
      return const AuthPage();
    }
  }
}
