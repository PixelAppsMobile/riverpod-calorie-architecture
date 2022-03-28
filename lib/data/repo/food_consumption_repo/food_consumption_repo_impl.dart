import 'package:dartz/dartz.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/repo/food_consumption_repo/food_consumption_repo.dart';
import 'package:totaltest/data/services/firestore/database_service.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';

class FoodConsumptionRepoImpl implements FoodConsumptionRepo {
  final String uid;
  final DatabaseService _databaseService;

  FoodConsumptionRepoImpl(this.uid, this._databaseService);

  @override
  Future<Either<AppError, FoodEntry>> addFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID == null);

    return _databaseService.createFoodEntry(overrideUid ?? uid, entry);
  }

  @override
  Future<Either<AppError, List<FoodEntry>>> getFoodEntries(
      {String? overrideUid}) async {
    return _databaseService.getFoodEntries(overrideUid ?? uid);
  }

  @override
  Future<Either<AppError, void>> updateFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID != null);
    return _databaseService.updateFoodEntry(overrideUid ?? uid, entry);
  }

  @override
  Future<Either<AppError, void>> deleteFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID != null);
    return _databaseService.deleteFoodEntry(
        overrideUid ?? uid, entry.documentID!);
  }
}
