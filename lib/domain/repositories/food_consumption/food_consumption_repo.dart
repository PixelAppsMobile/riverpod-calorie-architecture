import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/data/repositories/food_consumption/food_consumption_repo_impl.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/entities/food_entry.dart';

final foodConsumptionRepo = Provider.autoDispose(
  (ref) => FoodConsumptionRepoImpl(
    FirebaseAuth.instance.currentUser!.uid,
    ref.read(remoteDatabaseDataSource),
    ref.read(localStorageDataSource),
  ),
);

abstract class FoodConsumptionRepo {
  Future<Either<AppError, List<FoodEntry>>> getFoodEntries(
      {String? overrideUid});
  Future<Either<AppError, FoodEntry>> addFoodEntry(FoodEntry entry,
      {String? overrideUid});
  Future<Either<AppError, void>> updateFoodEntry(FoodEntry entry,
      {String? overrideUid});
  Future<Either<AppError, void>> deleteFoodEntry(FoodEntry entry,
      {String? overrideUid});
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid);
}
