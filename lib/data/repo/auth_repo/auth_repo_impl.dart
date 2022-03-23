import 'package:totaltest/core/firestore_strings.dart';
import 'package:totaltest/core/preference_strings.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/data/helper/prefs_helper/shared_prefs_helper.dart';
import 'package:totaltest/data/repo/auth_repo/auth_repo.dart';
import 'package:totaltest/data/services/firestore/database_service.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/domain/models/app_user.dart';

class AuthRepoImpl implements AuthRepo {
  final SharedPreferenceHelper _preferenceHelper;
  final DatabaseService _databaseService;

  const AuthRepoImpl(this._preferenceHelper, this._databaseService);

  @override
  AppUser getAppUser() {
    print(_preferenceHelper.getBool(SharedPreferences.isAdmit));
    return AppUser(
        user: FirebaseAuth.instance.currentUser,
        calorieLimit:
            _preferenceHelper.getDouble(SharedPreferences.calorieLimit) ??
                2100.0,
        role: (_preferenceHelper.getBool(SharedPreferences.isAdmit) ?? false)
            ? UserRole.Admin
            : UserRole.Normal);
  }

  @override
  Future<Either<AppError, User>> signInUsingCustomToken(
      String customToken) async {
    try {
      final userCred =
          await FirebaseAuth.instance.signInWithCustomToken(customToken);
      if (userCred.user != null) {
        final either = await _databaseService.getUser(userCred.user!.uid);
        return either.fold(
          (l) => Left(l),
          (r) async {
            await _preferenceHelper.setBool(
                SharedPreferences.isAdmit, r[FirestoreStrings.isAdmin]);
            await _preferenceHelper.setDouble(SharedPreferences.calorieLimit,
                r[FirestoreStrings.calorieLimit]);
            return Right(userCred.user!);
          },
        );
      } else {
        return Left(AppError(title: "User is null"));
      }
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await _preferenceHelper.clearAll();
  }

  @override
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid) async {
    try {
      final either = await _databaseService.updateCalorie(uid, calories);
      return either.fold(
        (l) => Left(l),
        (r) {
          _preferenceHelper.setDouble(SharedPreferences.calorieLimit, calories);
          return Right(AppSuccess());
        },
      );
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
