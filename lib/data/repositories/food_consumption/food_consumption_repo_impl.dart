import 'package:dartz/dartz.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

class FoodConsumptionRepoImpl extends FoodConsumptionRepo {
  final String uid;
  final RemoteDatabaseDataSource _remoteDatabaseDataSource;

  FoodConsumptionRepoImpl(this.uid, this._remoteDatabaseDataSource);

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
}
