import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/domain/entities/user_profile.dart';

part 'admin_overview_view_state.freezed.dart';

@freezed
abstract class AdminOverviewViewState with _$AdminOverviewViewState {
  const factory AdminOverviewViewState.init() = _AdminOverviewViewStateInit;
  const factory AdminOverviewViewState.ready(List<UserProfile> users) =
      _AdminOverviewViewStateReady;
  const factory AdminOverviewViewState.error(String errorText) =
      _AdminOverviewViewStateError;
  const factory AdminOverviewViewState.loading() =
      _AdminOverviewViewStateLoading;
}
