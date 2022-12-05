import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';

final localStorageDataSource = Provider((ref) => LocalStorageDataSourceImpl());

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  late SharedPreferences preferences;

  @override
  Future<Either<AppError, AppSuccess>> init() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      preferences = await SharedPreferences.getInstance();
      return Right(AppSuccess());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool?>> getBool(String key) async {
    try {
      bool? result = preferences.getBool(key);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> setBool(String key, bool value) async {
    try {
      bool result = await preferences.setBool(key, value);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, int?>> getInt(String key) async {
    try {
      int? result = preferences.getInt(key);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> setInt(String key, int value) async {
    try {
      bool result = await preferences.setInt(key, value);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, String?>> getString(String key) async {
    try {
      String? result = preferences.getString(key);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> setString(String key, String value) async {
    try {
      bool result = await preferences.setString(key, value);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> clearAll() async {
    try {
      bool result = await preferences.clear();
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, bool>> setDouble(String key, double value) async {
    try {
      bool result = await preferences.setDouble(key, value);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, double?>> getDouble(String key) async {
    try {
      double? result = preferences.getDouble(key);
      return Right(result);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
