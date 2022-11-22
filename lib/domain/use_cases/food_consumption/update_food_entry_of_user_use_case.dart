import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

final updateFoodEntryOfUserUseCase = Provider(
  (ref) => UpdateFoodEntryOfUserUseCase(
    ref.read(foodConsumptionRepo),
  ),
);

class UpdateFoodEntryOfUserUseCase
    implements UseCase<AppSuccess, UpdateFoodEntryOfUserUseCaseParam> {
  final FoodConsumptionRepo _foodConsumptionRepo;

  UpdateFoodEntryOfUserUseCase(this._foodConsumptionRepo);

  @override
  Future<Either<AppError, AppSuccess>> call(param) =>
      _foodConsumptionRepo.updateFoodEntry(
        param.foodEntry.toDto,
        overrideUid: param.uid,
      );
}

class UpdateFoodEntryOfUserUseCaseParam {
  final String? uid;
  final FoodEntry foodEntry;

  UpdateFoodEntryOfUserUseCaseParam({
    this.uid,
    required this.foodEntry,
  });
}
