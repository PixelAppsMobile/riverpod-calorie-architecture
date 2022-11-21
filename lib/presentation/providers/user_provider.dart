import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';
import 'package:totaltest/domain/models/app_user.dart';

final userProvider = StateNotifierProvider<UserProvider, AppUser?>(
    (ref) => UserProvider(ref.read(authRepo), null));

class UserProvider extends StateNotifier<AppUser?> {
  final AuthRepo _authRepo;
  UserProvider(this._authRepo, value) : super(value);

  Future<Either<AppError, AppSuccess>> signIn(String customToken) async {
    final _result = await _authRepo.signInUsingCustomToken(customToken);
    return _result.fold((l) {
      state = const AppUser(user: null, role: null);

      return Left(l);
    }, (r) {
      state = _authRepo.getAppUser();

      return Right(AppSuccess());
    });
  }

  Future<void> signOut() async {
    await _authRepo.logOut();
    state = const AppUser(user: null, role: null);
  }

  Future<void> initialize() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      state = const AppUser(user: null, role: null);
    } else {
      state = _authRepo.getAppUser();
    }
  }

  Future<Either<AppError, AppSuccess>> updateCalorieLimit(double limit) async {
    final _result = await _authRepo.updateCalorieLimit(limit, state!.user!.uid);
    return _result.fold((l) => Left(l), (r) {
      state = state!.copyWith(calorieLimit: limit);
      return Right(r);
    });
  }
}
