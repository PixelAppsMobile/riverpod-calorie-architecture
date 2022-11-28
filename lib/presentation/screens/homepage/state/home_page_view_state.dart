import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_view_state.freezed.dart';

@freezed
abstract class HomePageViewState with _$HomePageViewState {
  const factory HomePageViewState.init() = _HomePageViewStateInit;
  const factory HomePageViewState.ready({
    required bool loading,
    required bool showCalorieWarning,
  }) = _HomePageViewStateReady;
  const factory HomePageViewState.loading() = _HomePageViewStateLoading;
  const factory HomePageViewState.error(String message) =
      _HomePageViewStateError;
  const factory HomePageViewState.showSnackBar({
    required String message,
    required Color backgroundColor,
  }) = _HomePageViewStateShowSnackBar;
}
