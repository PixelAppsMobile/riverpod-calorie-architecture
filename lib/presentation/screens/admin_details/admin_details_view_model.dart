import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/domain/entities/calorie_stat.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/providers/admin/admin_provider.dart';
import 'package:totaltest/domain/providers/food_consumption/admin_food_consumption_provider.dart';
import 'package:totaltest/presentation/screens/admin_details/state/admin_details_view_state.dart';

class AdminDetailsViewModel extends StateNotifier<AdminDetailsViewState> {
  late UserProfile _currentUser;
  final AdminProvider _adminProvider;
  final AdminFoodConsumptionProvider _adminFoodConsumptionProvider;

  final String _uid;
  final TickerProvider _vsync;
  late TabController _tabController;

  late CalorieStats _stats;

  late AdminDetailsViewState cachedState;

  AdminDetailsViewModel(
    this._uid,
    this._adminProvider,
    this._adminFoodConsumptionProvider,
    this._vsync,
  ) : super(const AdminDetailsViewState.init()) {
    _initialize();
  }

  UserProfile get currentUser => _currentUser;

  CalorieStats get stats => _stats;

  Future<void> _initialize() async {
    state = const AdminDetailsViewState.loading();

    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: _vsync,
    );

    await _adminFoodConsumptionProvider.fetchFoodEntriesForUser(_uid);

    _updateFoodEntries();
  }

  void _updateFoodEntries() {
    _currentUser = _adminProvider.getUserByUID(_uid);
    getStats();
  }

  void getStats() {
    _stats = CalorieStats.fromFoodEntries(_currentUser.foodEntries!);
    _emitReady();
  }

  void _emitReady() {
    state = AdminDetailsViewState.ready(
      controller: _tabController,
      user: _currentUser,
      stats: stats,
    );
  }

  Future<void> deleteFoodEntry(FoodEntry entry) async {
    final either = await _adminFoodConsumptionProvider.deleteFoodEntry(
      entry,
      _currentUser.userId,
    );
    return either.fold(
      (l) {
        cachedState = state;
        state = AdminDetailsViewState.showAlert(l.title);
        state = cachedState;
      },
      (r) {
        _updateFoodEntries();
        getStats();
      },
    );
  }

  Future<void> editFoodEntry(FoodEntry entry) async {
    cachedState = state;
    state = AdminDetailsViewState.openBottomSheet(
      entry: entry,
      uid: _currentUser.userId,
      onPop: () {
        _updateFoodEntries();
        getStats();
      },
    );
    state = cachedState;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
