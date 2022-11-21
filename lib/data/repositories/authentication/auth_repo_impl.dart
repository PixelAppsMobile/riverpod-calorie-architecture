import 'package:totaltest/core/constants/firestore_strings.dart';
import 'package:totaltest/core/constants/preference_strings.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/data/dto/app_user_dto.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';
import 'package:totaltest/domain/enums/user_role.dart';

class AuthRepoImpl implements AuthRepo {
  final LocalStorageDataSource _localStorageDataSource;
  final RemoteDatabaseDataSource _remoteDatabaseDataSource;

  const AuthRepoImpl(
      this._localStorageDataSource, this._remoteDatabaseDataSource);

  @override
  AppUserDto get getAppUser {
    print(_localStorageDataSource.getBool(SharedPreferences.isAdmin));
    return AppUserDto(
        user: FirebaseAuth.instance.currentUser,
        calorieLimit:
            _localStorageDataSource.getDouble(SharedPreferences.calorieLimit) ??
                2100.0,
        role: (_localStorageDataSource.getBool(SharedPreferences.isAdmin) ??
                false)
            ? UserRole.admin
            : UserRole.normal);
  }

  @override
  Future<Either<AppError, User>> signInUsingCustomToken(
      String customToken) async {
    try {
      final userCred =
          await FirebaseAuth.instance.signInWithCustomToken(customToken);
      if (userCred.user != null) {
        final either =
            await _remoteDatabaseDataSource.getUser(userCred.user!.uid);
        return either.fold(
          (l) => Left(l),
          (r) async {
            await _localStorageDataSource.setBool(
                SharedPreferences.isAdmin, r[FirestoreStrings.isAdmin]);
            await _localStorageDataSource.setDouble(
                SharedPreferences.calorieLimit,
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
  Future<Either<AppError, AppSuccess>> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _localStorageDataSource.clearAll();
      return Right(AppSuccess());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid) async {
    try {
      final either =
          await _remoteDatabaseDataSource.updateCalorie(uid, calories);
      return either.fold(
        (l) => Left(l),
        (r) {
          _localStorageDataSource.setDouble(
              SharedPreferences.calorieLimit, calories);
          return Right(AppSuccess());
        },
      );
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
