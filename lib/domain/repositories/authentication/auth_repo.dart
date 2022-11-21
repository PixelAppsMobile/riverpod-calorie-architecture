import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/data/dto/app_user_dto.dart';
import 'package:totaltest/data/repositories/authentication/auth_repo_impl.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';

final authRepo = Provider.autoDispose((ref) => AuthRepoImpl(
    ref.read(localStorageDataSource), ref.read(remoteDatabaseDataSource)));

abstract class AuthRepo {
  Future<Either<AppError, User>> signInUsingCustomToken(String customToken);
  AppUserDto get getAppUser;
  Future<Either<AppError, AppSuccess>> logOut();
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid);
}
