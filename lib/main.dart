import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/data/repositories/food_consumption/food_consumption_repo_impl.dart';
import 'package:totaltest/domain/entities/base_user.dart';
import 'package:totaltest/presentation/app/app.dart';

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
