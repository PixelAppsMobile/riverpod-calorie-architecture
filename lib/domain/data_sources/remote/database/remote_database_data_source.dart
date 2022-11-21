import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/data/data_sources/remote/database/remote_database_data_source_impl.dart';
import 'package:totaltest/domain/entities/food_entry.dart';

import '../../../../core/result_type.dart';

final remoteDatabaseDataSource = Provider.autoDispose(
  (ref) => RemoteDatabaseDataSourceImpl(),
);

abstract class RemoteDatabaseDataSource {
  Future<Either<AppError, Map<String, dynamic>>> getUser(String uid);
  Future<Either<AppError, void>> updateCalorie(String uid, double calories);
  Future<Either<AppError, List<FoodEntry>>> getFoodEntries(String uid);
  Future<Either<AppError, FoodEntry>> createFoodEntry(
      String uid, FoodEntry entry);
  Future<Either<AppError, void>> updateFoodEntry(String uid, FoodEntry entry);
  Future<Either<AppError, void>> deleteFoodEntry(String uid, String id);
}
