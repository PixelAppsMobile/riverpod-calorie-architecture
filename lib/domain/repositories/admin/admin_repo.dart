import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/data/repositories/admin/admin_repo_impl.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';

final adminRepo = Provider.autoDispose(
    (ref) => AdminRepoImpl(ref.read(remoteDatabaseDataSource)));

abstract class AdminRepo {
  Future<Either<AppError, List<UserProfileDto>>> fetchAllUsers();
}
