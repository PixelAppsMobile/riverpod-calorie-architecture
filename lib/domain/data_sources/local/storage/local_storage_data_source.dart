import 'package:dartz/dartz.dart';
import 'package:totaltest/core/result_type.dart';

abstract class LocalStorageDataSource {
  Future<Either<AppError, AppSuccess>> init();

  Future<Either<AppError, bool?>> getBool(String key);
  Future<Either<AppError, bool>> setBool(String key, bool value);
  Future<Either<AppError, int?>> getInt(String key);
  Future<Either<AppError, bool>> setInt(String key, int value);
  Future<Either<AppError, String?>> getString(String key);
  Future<Either<AppError, bool>> setString(String key, String value);
  Future<Either<AppError, bool>> clearAll();
  Future<Either<AppError, bool>> setDouble(String key, double value);
  Future<Either<AppError, double?>> getDouble(String key);
}
