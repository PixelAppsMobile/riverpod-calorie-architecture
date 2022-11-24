import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/data_sources/remote/authentication/authentication_data_source_impl.dart';
import 'package:totaltest/data/dto/base_user_dto.dart';

final authenticationDataSource =
    Provider((ref) => AuthenticationDataSourceImpl());

abstract class AuthenticationDataSource {
  BaseUserDto? get currentUser;
  Future<Either<AppError, BaseUserDto>> signInUsingCustomToken(String token);
  Future<Either<AppError, AppSuccess>> signOut();
}
