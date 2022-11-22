import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

final updateCalorieLimitUseCase =
    Provider((ref) => UpdateCalorieLimitUseCase(ref.read(foodConsumptionRepo)));

class UpdateCalorieLimitUseCase
    implements UseCase<AppSuccess, UpdateCalorieLimitUseCaseParam> {
  final FoodConsumptionRepo _foodConsumptionRepo;

  UpdateCalorieLimitUseCase(this._foodConsumptionRepo);

  @override
  Future<Either<AppError, AppSuccess>> call(
      UpdateCalorieLimitUseCaseParam param) async {
    return _foodConsumptionRepo.updateCalorieLimit(param.limit, param.uid);
  }
}

class UpdateCalorieLimitUseCaseParam {
  final double limit;
  final String uid;

  UpdateCalorieLimitUseCaseParam(this.limit, this.uid);
}
