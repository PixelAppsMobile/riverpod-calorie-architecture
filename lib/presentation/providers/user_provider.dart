import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/use_cases/authentication/get_app_user_use_case.dart';
import 'package:totaltest/domain/use_cases/authentication/sign_in_using_custom_token_use_case.dart';
import 'package:totaltest/domain/use_cases/authentication/sign_out_use_case.dart';
import 'package:totaltest/domain/use_cases/authentication/update_calorie_limit_use_case.dart';

final userProvider = StateNotifierProvider<UserProvider, AppUser?>(
  (ref) => UserProvider(
    ref.read(getAppUserUseCase),
    ref.read(signOutUseCase),
    ref.read(signInUsingCustomTokenUseCase),
    ref.read(updateCalorieLimitUseCase),
    null,
  ),
);

class UserProvider extends StateNotifier<AppUser?> {
  final GetAppUserUseCase _getAppUserUseCase;
  final SignOutUseCase _signOutUseCase;
  final SignInUsingCustomTokenUseCase _signInUsingCustomTokenUseCase;
  final UpdateCalorieLimitUseCase _updateCalorieLimitUseCase;

  UserProvider(
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
        state = _getAppUserUseCase();

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
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      state = null;
    } else {
      state = _getAppUserUseCase();
    }
  }

  Future<Either<AppError, AppSuccess>> updateCalorieLimit(double limit) async {
    final _result = await _updateCalorieLimitUseCase(
      UpdateCalorieLimitUseCaseParam(limit, state!.user.uid),
    );
    return _result.fold((l) => Left(l), (r) {
      state = state!.copyWith(calorieLimit: limit);
      return Right(r);
    });
  }
}