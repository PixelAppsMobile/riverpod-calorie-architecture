import 'package:dartz/dartz.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

import '../../../core/constants/preference_strings.dart';

class FoodConsumptionRepoImpl extends FoodConsumptionRepo {
  final String uid;
  final RemoteDatabaseDataSource _remoteDatabaseDataSource;
  final LocalStorageDataSource _localStorageDataSource;

  FoodConsumptionRepoImpl(
      this.uid, this._remoteDatabaseDataSource, this._localStorageDataSource);

  @override
  Future<Either<AppError, FoodEntry>> addFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID == null);

    return _remoteDatabaseDataSource.createFoodEntry(overrideUid ?? uid, entry);
  }

  @override
  Future<Either<AppError, List<FoodEntry>>> getFoodEntries(
      {String? overrideUid}) async {
    return _remoteDatabaseDataSource.getFoodEntries(overrideUid ?? uid);
  }

  @override
  Future<Either<AppError, void>> updateFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID != null);
    return _remoteDatabaseDataSource.updateFoodEntry(overrideUid ?? uid, entry);
  }

  @override
  Future<Either<AppError, void>> deleteFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID != null);
    return _remoteDatabaseDataSource.deleteFoodEntry(
        overrideUid ?? uid, entry.documentID!);
  }

  @override
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid) async {
    try {
      final either =
          await _remoteDatabaseDataSource.updateCalorie(uid, calories);
      return either.fold(
        (l) => Left(l),
        (r) {
          _localStorageDataSource.setDouble(
              SharedPreferences.calorieLimit, calories);
          return Right(AppSuccess());
        },
      );
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
