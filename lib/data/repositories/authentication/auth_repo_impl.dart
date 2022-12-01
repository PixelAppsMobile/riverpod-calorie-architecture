import 'package:totaltest/core/constants/firestore_constants.dart';
import 'package:totaltest/core/constants/local_storage_constants.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/data/dto/app_user_dto.dart';
import 'package:totaltest/data/dto/base_user_dto.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/data_sources/remote/authentication/authentication_data_source.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';
import 'package:totaltest/domain/enums/user_role.dart';

class AuthRepoImpl implements AuthRepo {
  final LocalStorageDataSource _localStorageDataSource;
  final RemoteDatabaseDataSource _remoteDatabaseDataSource;
  final AuthenticationDataSource _authenticationDataSource;

  const AuthRepoImpl(
    this._localStorageDataSource,
    this._remoteDatabaseDataSource,
    this._authenticationDataSource,
  );

  @override
  Future<Either<AppError, AppUserDto?>> getAppUser() async {
    BaseUserDto? _baseUser = _authenticationDataSource.currentUser;

    if (_baseUser != null) {
      final getCalorieLimitResult = await _localStorageDataSource
          .getDouble(LocalStorageConstants.calorieLimit);

      return getCalorieLimitResult.fold(
        (l) => Left(l),
        (r) async {
          double calorieLimit = r ?? 2100.0;
          final isAdminResult = await _localStorageDataSource
              .getBool(LocalStorageConstants.isAdmin);

          return isAdminResult.fold(
            (l) => Left(l),
            (r) {
              bool isAdmin = r ?? false;

              return Right(AppUserDto(
                user: _baseUser,
                calorieLimit: calorieLimit,
                role: isAdmin ? UserRole.admin : UserRole.normal,
              ));
            },
          );
        },
      );
    } else {
      return const Right(null);
    }
  }

  @override
  Future<Either<AppError, BaseUserDto>> signInUsingCustomToken(
      String customToken) async {
    final result =
        await _authenticationDataSource.signInUsingCustomToken(customToken);

    return result.fold(
      (l) => Left(l),
      (baseUser) async {
        final either = await _remoteDatabaseDataSource.getUser(baseUser.uid);
        return either.fold(
          (l) => Left(l),
          (r) async {
            await _localStorageDataSource.setBool(
                LocalStorageConstants.isAdmin, r[FirestoreConstants.isAdmin]);
            await _localStorageDataSource.setDouble(
                LocalStorageConstants.calorieLimit,
                r[FirestoreConstants.calorieLimit]);
            return Right(baseUser);
          },
        );
      },
    );
  }

  @override
  Future<Either<AppError, AppSuccess>> logOut() async {
    final result = await _authenticationDataSource.signOut();

    return result.fold(
      (l) => Left(l),
      (r) async {
        await _localStorageDataSource.clearAll();
        return Right(r);
      },
    );
  }
}
