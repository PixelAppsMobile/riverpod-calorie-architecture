import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/data/data_sources/remote/database/remote_database_data_source_impl.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';

import '../../../../core/result_type.dart';

final remoteDatabaseDataSource = Provider.autoDispose(
  (ref) => RemoteDatabaseDataSourceImpl(),
);

abstract class RemoteDatabaseDataSource {
  Future<Either<AppError, Map<String, dynamic>>> getUser(String uid);
  Future<Either<AppError, AppSuccess>> updateCalorie(
      String uid, double calories);
  Future<Either<AppError, List<FoodEntryDto>>> getFoodEntries(String uid);
  Future<Either<AppError, FoodEntryDto>> createFoodEntry(
      String uid, FoodEntryDto entry);
  Future<Either<AppError, AppSuccess>> updateFoodEntry(
      String uid, FoodEntryDto entry);
  Future<Either<AppError, AppSuccess>> deleteFoodEntry(String uid, String id);
  Future<Either<AppError, List<UserProfileDto>>> fetchAllUsers();
}
