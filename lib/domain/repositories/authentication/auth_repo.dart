import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/data/dto/app_user_dto.dart';
import 'package:totaltest/data/dto/base_user_dto.dart';
import 'package:totaltest/data/repositories/authentication/auth_repo_impl.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/data_sources/remote/authentication/authentication_data_source.dart';

final authRepo = Provider.autoDispose((ref) => AuthRepoImpl(
    ref.read(localStorageDataSource),
    ref.read(remoteDatabaseDataSource),
    ref.read(authenticationDataSource)));

abstract class AuthRepo {
  Future<Either<AppError, BaseUserDto>> signInUsingCustomToken(
      String customToken);
  AppUserDto? get getAppUser;
  Future<Either<AppError, AppSuccess>> logOut();
}
