import 'package:flutter/material.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/use_cases/food_consumption/add_food_entry_of_user_use_case.dart';
import 'package:totaltest/domain/use_cases/food_consumption/get_food_entries_of_user_use_case.dart';
import 'package:totaltest/core/base_notifier/base_view_state_notifier.dart';
import 'package:totaltest/domain/providers/user/user_provider.dart';
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

  final GetFoodEntriesOfUseCase _getFoodEntriesOfUseCase;
  final AddFoodEntryOfUserUseCase _addFoodEntryOfUserUseCase;

  final UserProvider _userProvider;

  HomePageViewModel(
    this._getFoodEntriesOfUseCase,
    this._addFoodEntryOfUserUseCase,
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

      final either =
          await _getFoodEntriesOfUseCase(_userProvider.state!.user.uid);
      either.fold(
        (l) {
          state = HomePageViewState.error(l.title);
        },
        (r) {
          List<FoodEntry> data = r.map((e) => e).toList().cast<FoodEntry>();
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
    final data = await _addFoodEntryOfUserUseCase(
      AddFoodEntryOfUserUseCaseParam(
          foodEntry: FoodEntry(
            name: name,
            time: consumptionTime,
            calorificValue: calorificValue,
          ),
          uid: _userProvider.state!.user.uid),
    );
    data.fold(
      (l) {
        view!.showSnackbar(l.title, color: AppColor.errorRed);
      },
      (r) {
        foodEntries.add(r);
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
