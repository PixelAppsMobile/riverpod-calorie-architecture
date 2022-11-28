import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_page_view_state.freezed.dart';

@freezed
abstract class AuthPageViewState with _$AuthPageViewState {
  const factory AuthPageViewState.init() = _AuthPageViewStateInit;
  const factory AuthPageViewState.ready(TextEditingController controller) =
      _AuthPageViewStateReady;
  const factory AuthPageViewState.error(String errorText) =
      _AuthPageViewStateError;
  const factory AuthPageViewState.loading() = _AuthPageViewStateLoading;
}
