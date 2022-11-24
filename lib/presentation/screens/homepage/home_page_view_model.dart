import 'package:flutter/material.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/repositories/food_consumption/food_consumption_repo.dart';
import 'package:totaltest/presentation/providers/base_view_state_notifier.dart';
import 'package:totaltest/presentation/providers/user_provider.dart';
import 'package:totaltest/presentation/res/colors.dart';
import 'package:totaltest/presentation/screens/homepage/state/home_page_view_state.dart';

mixin HomePageView {
  void showSnackbar(String message, {Color? color});
}

class HomePageViewModel
    extends BaseViewStateNotifier<HomePageView, HomePageViewState> {
  //DataElements
  final List<FoodEntry> foodEntries = [];
  bool _showCalorieWarning = false;

  //Interacting Classes
  final FoodConsumptionRepo _foodConsumptionRepo;
  final UserProvider _userProvider;

  HomePageViewModel(
    this._foodConsumptionRepo,
    this._userProvider,
  ) : super(const HomePageViewState.init()) {
    _initialize();
  }

  void _initialize() {
    getFoodEntries();
  }

  double get todayCalories {
    if (foodEntries.isEmpty) {
      return 2100;
    } else {
      return 100;
    }
  }

  double get extraCalories =>
      todayCalories - (_userProvider.state!.calorieLimit ?? 2100);

  Future<void> getFoodEntries() async {
    try {
      state = const HomePageViewState.loading();

      final either = await _foodConsumptionRepo.getFoodEntries();
      either.fold(
        (l) {
          state = HomePageViewState.error(l.title);
        },
        (r) {
          List<FoodEntry> data =
              r.map((e) => e.toEntity).toList().cast<FoodEntry>();
          foodEntries.addAll(data);
          calculateIfCaloriesOvertake();
          _emitReady();
        },
      );
    } catch (e) {
      view!
          .showSnackbar("Error getting good entries", color: AppColor.errorRed);
    }
  }

  Future<void> addNewEntry(
      String name, double calorificValue, DateTime consumptionTime) async {
    final data = await _foodConsumptionRepo.addFoodEntry(
      FoodEntry(
        name: name,
        time: consumptionTime,
        calorificValue: calorificValue,
      ).toDto,
    );
    data.fold(
      (l) {
        view!.showSnackbar(l.title, color: AppColor.errorRed);
      },
      (r) {
        foodEntries.add(r.toEntity);
        foodEntries.sort((a, b) => b.time.compareTo(a.time));
        calculateIfCaloriesOvertake();
        view!.showSnackbar(
          "Entry added succesfully",
          color: AppColor.successGreen,
        );
        _emitReady();
      },
    );
  }

  void calculateIfCaloriesOvertake() {
    _showCalorieWarning =
        todayCalories > (_userProvider.state!.calorieLimit ?? 2100);
  }

  Future<void> updateCalorieLimit(double limit) async {
    final _result = await _userProvider.updateCalorieLimit(limit);
    _result.fold(
      (l) =>
          view!.showSnackbar("Error Updating Limit", color: AppColor.errorRed),
      (r) {
        view!.showSnackbar("Daily Limit Updated Successfully",
            color: AppColor.successGreen);
        calculateIfCaloriesOvertake();
        _emitReady();
      },
    );
  }

  Future<void> logOut() async {
    await _userProvider.signOut();
  }

  _emitReady({bool loading = false}) {
    state = HomePageViewState.ready(
      loading: loading,
      showCalorieWarning: _showCalorieWarning,
    );
  }
}
