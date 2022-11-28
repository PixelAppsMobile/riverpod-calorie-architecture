import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/domain/entities/calorie_stat.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';

part 'admin_details_view_state.freezed.dart';

@freezed
abstract class AdminDetailsViewState with _$AdminDetailsViewState {
  const factory AdminDetailsViewState.init() = _AdminDetailsViewStateInit;
  const factory AdminDetailsViewState.loading() = _AdminDetailsViewStateLoading;
  const factory AdminDetailsViewState.error(String message) =
      _AdminDetailsViewStateError;
  const factory AdminDetailsViewState.ready({
    required TabController controller,
    required UserProfile user,
    required CalorieStats stats,
  }) = _AdminDetailsViewStateReady;
  const factory AdminDetailsViewState.showAlert(String message) =
      _AdminDetailsViewStateShowAlert;
  const factory AdminDetailsViewState.openBottomSheet({
    required FoodEntry entry,
    required String uid,
    required void Function() onPop,
  }) = _AdminDetailsViewStateOpenBottomSheet;
}
