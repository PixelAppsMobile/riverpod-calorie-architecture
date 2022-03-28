import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/services/firestore/firestore_service.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';

final databaseService = Provider.autoDispose(
  (ref) => FirestoreServiceImpl(),
);

abstract class DatabaseService {
  Future<Either<AppError, Map<String, dynamic>>> getUser(String uid);
  Future<Either<AppError, void>> updateCalorie(String uid, double calories);
  Future<Either<AppError, List<FoodEntry>>> getFoodEntries(String uid);
  Future<Either<AppError, FoodEntry>> createFoodEntry(
      String uid, FoodEntry entry);
  Future<Either<AppError, void>> updateFoodEntry(String uid, FoodEntry entry);
  Future<Either<AppError, void>> deleteFoodEntry(String uid, String id);
}
