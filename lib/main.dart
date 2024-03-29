import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/data/repositories/food_consumption/food_consumption_repo_impl.dart';
import 'package:totaltest/domain/entities/base_user.dart';
import 'package:totaltest/presentation/res/colors/colors_res.dart';
import 'package:totaltest/presentation/screens/splash/splash_page.dart';

import 'data/repositories/authentication/auth_repo_impl.dart';

@GenerateMocks([
  LocalStorageDataSourceImpl,
  AuthRepoImpl,
  FoodConsumptionRepoImpl,
  BaseUser
])
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
    return const MaterialApp(
      title: 'Calories Tracker',
      home: SplashPage(),
    );
  }
}
