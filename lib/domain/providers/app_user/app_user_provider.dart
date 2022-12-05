import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/use_cases/app_user/get_app_user_use_case.dart';
import 'package:totaltest/domain/use_cases/app_user/sign_in_using_custom_token_use_case.dart';
import 'package:totaltest/domain/use_cases/app_user/sign_out_use_case.dart';
import 'package:totaltest/domain/use_cases/app_user/update_calorie_limit_use_case.dart';

final appUserProvider = AsyncNotifierProvider<AppUserProvider, AppUser?>(
  AppUserProvider.new,
);

class AppUserProvider extends AsyncNotifier<AppUser?> {
  late final GetAppUserUseCase _getAppUserUseCase;
  late final SignOutUseCase _signOutUseCase;
  late final SignInUsingCustomTokenUseCase _signInUsingCustomTokenUseCase;
  late final UpdateCalorieLimitUseCase _updateCalorieLimitUseCase;

  @override
  FutureOr<AppUser?> build() async {
    _getAppUserUseCase = ref.read(getAppUserUseCase);
    _signOutUseCase = ref.read(signOutUseCase);
    _signInUsingCustomTokenUseCase = ref.read(signInUsingCustomTokenUseCase);
    _updateCalorieLimitUseCase = ref.read(updateCalorieLimitUseCase);

    final result = await _getAppUserUseCase();
    return result.fold(
      (l) => null,
      (r) => r,
    );
  }

  //? The project contains Non-AsyncNotifier providers. This getter is made public
  //? to be able to access state value in those providers. {Eg. UserFoodConsumptionProvider}
  //? Otherwise, recommended to be accessed via ref.read(appUserProvider);
  AppUser? get currentUser => state.value;

  Future<Either<AppError, AppSuccess>> signIn(String customToken) async {
    final _result = await _signInUsingCustomTokenUseCase(customToken);
    return _result.fold(
      (l) {
        state = const AsyncData(null);

        return Left(l);
      },
      (r) async {
        final result = await _getAppUserUseCase();

        state = result.fold(
          (l) => AsyncError(l, StackTrace.current),
          (r) => AsyncData(r),
        );

        return Right(AppSuccess());
      },
    );
  }

  Future<void> signOut() async {
    final result = await _signOutUseCase();
    result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => state = const AsyncData(null),
    );
  }

  Future<Either<AppError, AppSuccess>> updateCalorieLimit(double limit) async {
    if (state is AsyncData) {
      AppUser user = state.asData!.value!;
      final _result = await _updateCalorieLimitUseCase(
        UpdateCalorieLimitUseCaseParam(limit, user.user.uid),
      );
      return _result.fold(
        (l) => Left(l),
        (r) {
          state = AsyncData(user.copyWith(calorieLimit: limit));

          return Right(r);
        },
      );
    }
    return Left(AppError(
        title: 'AsyncData is not the state of the App User Provider.'));
  }
}
