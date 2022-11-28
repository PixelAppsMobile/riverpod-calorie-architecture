import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_food_entry_bottom_sheet_view_state.freezed.dart';

@freezed
abstract class UpdateFoodEntryBottomSheetViewState
    with _$UpdateFoodEntryBottomSheetViewState {
  const factory UpdateFoodEntryBottomSheetViewState.init() =
      _UpdateFoodEntryBottomSheetViewStateInit;
  const factory UpdateFoodEntryBottomSheetViewState.loading() =
      _UpdateFoodEntryBottomSheetViewStateLoading;
  const factory UpdateFoodEntryBottomSheetViewState.error(String message) =
      _UpdateFoodEntryBottomSheetViewStateError;
  const factory UpdateFoodEntryBottomSheetViewState.ready({
    required FocusNode foodNameNode,
    required TextEditingController foodNameController,
    required FocusNode calorificValueNode,
    required TextEditingController calorificValueController,
  }) = _UpdateFoodEntryBottomSheetViewStateReady;
  const factory UpdateFoodEntryBottomSheetViewState.showAlert(String message) =
      _UpdateFoodEntryBottomSheetViewStateShowAlert;
  const factory UpdateFoodEntryBottomSheetViewState.pop() =
      _UpdateFoodEntryBottomSheetViewStatePop;
}
