import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/data/repositories/food_consumption/food_consumption_repo_impl.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';

final foodConsumptionRepo = Provider.autoDispose(
  (ref) => FoodConsumptionRepoImpl(
    FirebaseAuth.instance.currentUser!.uid,
    ref.read(remoteDatabaseDataSource),
    ref.read(localStorageDataSource),
  ),
);

abstract class FoodConsumptionRepo {
  Future<Either<AppError, List<FoodEntryDto>>> getFoodEntries(
      {String? overrideUid});
  Future<Either<AppError, FoodEntryDto>> addFoodEntry(FoodEntryDto entry,
      {String? overrideUid});
  Future<Either<AppError, AppSuccess>> updateFoodEntry(FoodEntryDto entry,
      {String? overrideUid});
  Future<Either<AppError, AppSuccess>> deleteFoodEntry(String documentId,
      {String? overrideUid});
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid);
}
