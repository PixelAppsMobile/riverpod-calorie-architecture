import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';

final getFoodEntriesOfUseCase =
    Provider((ref) => GetFoodEntriesOfUseCase(ref.read(foodConsumptionRepo)));

class GetFoodEntriesOfUseCase implements UseCase<List<FoodEntry>, String?> {
  final FoodConsumptionRepo _foodConsumptionRepo;

  GetFoodEntriesOfUseCase(this._foodConsumptionRepo);

  @override
  Future<Either<AppError, List<FoodEntry>>> call(String? param) async {
    final result =
        await _foodConsumptionRepo.getFoodEntries(overrideUid: param);

    return result.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity).toList().cast<FoodEntry>()),
    );
  }
}
