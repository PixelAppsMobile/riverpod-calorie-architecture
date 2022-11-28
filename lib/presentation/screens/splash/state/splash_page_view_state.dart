import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/domain/entities/app_user.dart';

part 'splash_page_view_state.freezed.dart';

@freezed
abstract class SplashPageViewState with _$SplashPageViewState {
  const factory SplashPageViewState.loading() = _SplashPageViewStateLoading;
  const factory SplashPageViewState.ready(AppUser? user) =
      _SplashPageViewStateReady;
}
