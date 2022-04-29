import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:totaltest/data/helper/prefs_helper/shared_prefs_helper.dart';
import 'package:totaltest/domain/providers/user_provider.dart';
import 'package:totaltest/presentation/screens/splash/splash_screen.dart';

import 'data/repo/auth_repo/auth_repo_impl.dart';

@GenerateMocks([SharedPreferenceHelper, AuthRepoImpl],
    customMocks: [MockSpec<UserProvider>(returnNullOnMissingStub: true)])
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calories Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
