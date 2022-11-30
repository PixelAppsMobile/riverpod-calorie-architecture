import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/domain/use_cases/food_consumption/add_food_entry_of_user_use_case.dart';
import 'package:totaltest/domain/use_cases/food_consumption/get_food_entries_of_user_use_case.dart';

final userFoodConsumptionProvider = StateNotifierProvider(
  (ref) {
    AppUser? user = ref.watch(appUserProvider).value;

    return UserFoodConsumptionProvider(
      [],
      ref.read(getFoodEntriesOfUseCase),
      ref.read(addFoodEntryOfUserUseCase),
      user,
    );
  },
);

class UserFoodConsumptionProvider extends StateNotifier<List<FoodEntry>> {
  final GetFoodEntriesOfUseCase _getFoodEntriesOfUseCase;
  final AddFoodEntryOfUserUseCase _addFoodEntryOfUserUseCase;

  final AppUser? _currentUser;

  UserFoodConsumptionProvider(
    List<FoodEntry> state,
    this._getFoodEntriesOfUseCase,
    this._addFoodEntryOfUserUseCase,
    this._currentUser,
  ) : super(state);

  double get todayCalories {
    if (state.isEmpty) {
      return 2100;
    } else {
      return 100;
    }
  }

  double get extraCalories =>
      todayCalories - (_currentUser!.calorieLimit ?? 2100);

  bool get isCalorieIntakeExceeded =>
      todayCalories > (_currentUser!.calorieLimit ?? 2100);

  Future<Either<AppError, AppSuccess>> getFoodEntries() async {
    final either = await _getFoodEntriesOfUseCase(_currentUser!.user.uid);
    return either.fold(
      (l) {
        state = [];
        return Left(l);
      },
      (r) {
        List<FoodEntry> data = r.map((e) => e).toList().cast<FoodEntry>();
        state = [...data];
        return Right(AppSuccess());
      },
    );
  }

  Future<Either<AppError, AppSuccess>> addNewFoodEntry(FoodEntry entry) async {
    final data = await _addFoodEntryOfUserUseCase(
      AddFoodEntryOfUserUseCaseParam(
        foodEntry: entry,
        uid: _currentUser!.user.uid,
      ),
    );
    return data.fold(
      (l) => Left(l),
      (r) {
        List<FoodEntry> newEntries = [...state, r];
        newEntries.sort((a, b) => b.time.compareTo(a.time));
        state = newEntries;
        return Right(AppSuccess());
      },
    );
  }
}
