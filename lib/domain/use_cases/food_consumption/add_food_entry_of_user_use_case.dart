import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

final addFoodEntryOfUserUseCase = Provider(
  (ref) => AddFoodEntryOfUserUseCase(
    ref.read(foodConsumptionRepo),
  ),
);

class AddFoodEntryOfUserUseCase
    implements UseCase<FoodEntry, AddFoodEntryOfUserUseCaseParam> {
  final FoodConsumptionRepo _foodConsumptionRepo;

  AddFoodEntryOfUserUseCase(this._foodConsumptionRepo);

  @override
  Future<Either<AppError, FoodEntry>> call(param) async {
    final result = await _foodConsumptionRepo.addFoodEntry(
      param.foodEntry.toDto,
      overrideUid: param.uid,
    );
    return result.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity),
    );
  }
}

class AddFoodEntryOfUserUseCaseParam {
  final String? uid;
  final FoodEntry foodEntry;

  AddFoodEntryOfUserUseCaseParam({
    this.uid,
    required this.foodEntry,
  });
}
