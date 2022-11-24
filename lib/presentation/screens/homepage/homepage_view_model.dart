import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/presentation/providers/base_view_model.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/res/colors.dart';

final homePageViewModel = ChangeNotifierProvider.autoDispose((ref) =>
    HomePageViewModel(
        ref.read(foodConsumptionRepo), ref.read(userProvider.notifier)));

mixin HomePageView {
  void showSnackbar(String message, {Color? color});
}

class HomePageViewModel extends BaseViewModel<HomePageView> {
  //DataElements
  final List<FoodEntry> foodEntries = [];
  bool showCalorieWarning = false;

  //Interacting Classes
  final FoodConsumptionRepo _foodConsumptionRepo;
  final UserProvider _userProvider;
  HomePageViewModel(this._foodConsumptionRepo, this._userProvider);

  void initialize() {
    getFoodEntries();
  }

  double get todayCalories {
    if (foodEntries.isEmpty) {
      return 2100;
    } else {
      return 100;
      // return foodEntries
      //     .where((element) => element.time.isSameDate(DateTime.now()))
      //     .map<double>((e) => e.calorificValue)
      //     .reduce((a, b) => a + b);
    }
  }

  double get extraCalories =>
      todayCalories - (_userProvider.state!.calorieLimit ?? 2100);

  Future<void> getFoodEntries() async {
    try {
      toggleLoadingOn(true, turnOffNotifyListeners: true);
      final either = await _foodConsumptionRepo.getFoodEntries();
      final data = either.fold<List<FoodEntry>>(
        (l) {
          print(l.title);
          return [];
        },
        (r) => r.map((e) => e.toEntity).toList().cast<FoodEntry>(),
      );
      foodEntries.addAll(data);
      calculateIfCaloriesOvertake();
      toggleLoadingOn(false);
      notifyListeners();
    } catch (e) {
      view!
          .showSnackbar("Error getting good entries", color: AppColor.errorRed);
    }
  }

  Future<void> addNewEntry(
      String name, double calorificValue, DateTime consumptionTime) async {
    final data = await _foodConsumptionRepo.addFoodEntry(FoodEntry(
            name: name, time: consumptionTime, calorificValue: calorificValue)
        .toDto);
    data.fold((l) {
      view!.showSnackbar(l.title, color: AppColor.errorRed);
    }, (r) {
      foodEntries.add(r.toEntity);
      foodEntries.sort((a, b) => b.time.compareTo(a.time));
      calculateIfCaloriesOvertake();
      view!.showSnackbar("Entry added succesfully",
          color: AppColor.successGreen);
      notifyListeners();
    });
  }

  void calculateIfCaloriesOvertake() {
    showCalorieWarning =
        todayCalories > (_userProvider.state!.calorieLimit ?? 2100);
    notifyListeners();
  }

  Future<void> updateCalorieLimit(double limit) async {
    final _result = await _userProvider.updateCalorieLimit(limit);
    _result.fold(
        (l) => view!.showSnackbar("Error Updating Limit",
            color: AppColor.errorRed), (r) {
      view!.showSnackbar("Daily Limit Updated Successfully",
          color: AppColor.successGreen);
      calculateIfCaloriesOvertake();
      notifyListeners();
    });
  }

  Future<void> logOut() async {
    await _userProvider.signOut();
  }
}
