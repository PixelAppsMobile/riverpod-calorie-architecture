import 'package:dartz/dartz.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/repositories/admin/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final RemoteDatabaseDataSource _remoteDatabaseDataSource;

  AdminRepoImpl(this._remoteDatabaseDataSource);

  @override
  Future<Either<AppError, List<UserProfileDto>>> fetchAllUsers() async =>
      _remoteDatabaseDataSource.fetchAllUsers();
}
