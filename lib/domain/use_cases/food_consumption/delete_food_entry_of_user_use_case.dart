import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

final deleteFoodEntryOfUserUseCase = Provider(
    (ref) => DeleteFoodEntryOfUserUseCase(ref.read(foodConsumptionRepo)));

class DeleteFoodEntryOfUserUseCase
    implements UseCase<AppSuccess, DeleteFoodEntryOfUserUseCaseParam> {
  final FoodConsumptionRepo _foodConsumptionRepo;

  DeleteFoodEntryOfUserUseCase(this._foodConsumptionRepo);

  @override
  Future<Either<AppError, AppSuccess>> call(
      DeleteFoodEntryOfUserUseCaseParam param) async {
    return _foodConsumptionRepo.deleteFoodEntry(
      param.documentId,
      overrideUid: param.uid,
    );
  }
}

class DeleteFoodEntryOfUserUseCaseParam {
  final String documentId;
  final String? uid;

  DeleteFoodEntryOfUserUseCaseParam({
    required this.documentId,
    this.uid,
  });
}
