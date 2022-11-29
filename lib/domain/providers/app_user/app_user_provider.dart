import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/use_cases/app_user/get_app_user_use_case.dart';
import 'package:totaltest/domain/use_cases/app_user/sign_in_using_custom_token_use_case.dart';
import 'package:totaltest/domain/use_cases/app_user/sign_out_use_case.dart';
import 'package:totaltest/domain/use_cases/app_user/update_calorie_limit_use_case.dart';

final appUserProvider = StateNotifierProvider<AppUserProvider, AppUser?>(
  (ref) => AppUserProvider(
    ref.read(getAppUserUseCase),
    ref.read(signOutUseCase),
    ref.read(signInUsingCustomTokenUseCase),
    ref.read(updateCalorieLimitUseCase),
    null,
  ),
);

class AppUserProvider extends StateNotifier<AppUser?> {
  final GetAppUserUseCase _getAppUserUseCase;
  final SignOutUseCase _signOutUseCase;
  final SignInUsingCustomTokenUseCase _signInUsingCustomTokenUseCase;
  final UpdateCalorieLimitUseCase _updateCalorieLimitUseCase;

  AppUserProvider(
    this._getAppUserUseCase,
    this._signOutUseCase,
    this._signInUsingCustomTokenUseCase,
    this._updateCalorieLimitUseCase,
    value,
  ) : super(value);

  Future<Either<AppError, AppSuccess>> signIn(String customToken) async {
    final _result = await _signInUsingCustomTokenUseCase(customToken);
    return _result.fold(
      (l) {
        state = null;

        return Left(l);
      },
      (r) async {
        final result = await _getAppUserUseCase();

        state = result.fold(
          (l) => null,
          (r) => r,
        );

        return Right(AppSuccess());
      },
    );
  }

  Future<void> signOut() async {
    final result = await _signOutUseCase();
    result.fold(
      (l) => null,
      (r) => state = null,
    );
  }

  Future<void> initialize() async {
    final result = await _getAppUserUseCase();
    state = result.fold(
      (l) => null,
      (r) => r,
    );
  }

  Future<Either<AppError, AppSuccess>> updateCalorieLimit(double limit) async {
    final _result = await _updateCalorieLimitUseCase(
      UpdateCalorieLimitUseCaseParam(limit, state!.user.uid),
    );
    return _result.fold(
      (l) => Left(l),
      (r) {
        state = state!.copyWith(calorieLimit: limit);
        return Right(r);
      },
    );
  }
}
