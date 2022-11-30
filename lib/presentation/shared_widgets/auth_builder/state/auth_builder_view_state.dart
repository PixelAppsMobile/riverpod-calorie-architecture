import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_builder_view_state.freezed.dart';

@freezed
class AuthBuilderViewState with _$AuthBuilderViewState {
  const factory AuthBuilderViewState.auth() = _AuthBuilderViewStateAuth;
  const factory AuthBuilderViewState.admin() = _AuthBuilderViewStateAdmin;
  const factory AuthBuilderViewState.user() = _AuthBuilderViewStateUser;
}
