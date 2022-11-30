import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/providers/food_consumption/user_food_consumption_provider.dart';
import 'package:totaltest/domain/providers/app_user/app_user_provider.dart';
import 'package:totaltest/presentation/res/colors.dart';
import 'package:totaltest/presentation/screens/homepage/state/home_page_view_state.dart';

class HomePageViewModel extends StateNotifier<HomePageViewState> {
  final AppUserProvider _appUserProvider;
  final UserFoodConsumptionProvider _userFoodConsumptionProvider;

  late HomePageViewState _cachedState;

  HomePageViewModel(
    this._appUserProvider,
    this._userFoodConsumptionProvider,
  ) : super(const HomePageViewState.init()) {
    _initialize();
  }

  double get extraCalories => _userFoodConsumptionProvider.extraCalories;

  void _initialize() {
    getFoodEntries();
  }

  Future<void> getFoodEntries() async {
    state = const HomePageViewState.loading();

    final either = await _userFoodConsumptionProvider.getFoodEntries();
    either.fold(
      (l) {
        state = HomePageViewState.error(l.title);
      },
      (r) {
        checkIfCalorieIntakeIsExceededing();
        _emitReady();
      },
    );
  }

  Future<void> addNewEntry(
    String name,
    double calorificValue,
    DateTime consumptionTime,
  ) async {
    final result = await _userFoodConsumptionProvider.addNewFoodEntry(
      FoodEntry(
        name: name,
        time: consumptionTime,
        calorificValue: calorificValue,
      ),
    );
    result.fold(
      (l) {
        _cachedState = state;
        state = HomePageViewState.error(l.title);
        state = _cachedState;
      },
      (r) {
        checkIfCalorieIntakeIsExceededing();

        _cachedState = state;

        state = const HomePageViewState.showSnackBar(
          message: "Entry added succesfully",
          backgroundColor: AppColor.successGreen,
        );

        state = _cachedState;
      },
    );
  }

  void checkIfCalorieIntakeIsExceededing() {
    if (_userFoodConsumptionProvider.isCalorieIntakeExceeded) {
      state = const HomePageViewState.showCaloriesLimitExceededWarning();
    } else {
      _emitReady();
    }
  }

  Future<void> updateCalorieLimit(double limit) async {
    final _result = await _appUserProvider.updateCalorieLimit(limit);
    _result.fold(
      (l) {
        _cachedState = state;
        state = const HomePageViewState.showSnackBar(
          message: "Error Updating Limit",
          backgroundColor: AppColor.errorRed,
        );
        state = _cachedState;
      },
      (r) {
        _cachedState = state;

        state = const HomePageViewState.showSnackBar(
          message: "Daily Limit Updated Successfully",
          backgroundColor: AppColor.successGreen,
        );
        state = _cachedState;

        checkIfCalorieIntakeIsExceededing();
      },
    );
  }

  void openAddFoodEntrySheet() {
    _cachedState = state;
    state = const HomePageViewState.showAddFoodEntrySheet();
    state = _cachedState;
  }

  void openUpdateCalorieLimitSheet() {
    _cachedState = state;
    state = const HomePageViewState.showCalorieLimitUpdateSheet();
    state = _cachedState;
  }

  Future<void> logOut() async {
    await _appUserProvider.signOut();
  }

  _emitReady() {
    state = HomePageViewState.ready(_userFoodConsumptionProvider.state);
  }
}
