import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart';
import 'package:totaltest/data/repositories/init_services/init_services_repo_impl.dart';

final initServicesRepo =
    Provider((ref) => InitServicesRepoImpl(ref.read(localStorageDataSource)));

abstract class InitServicesRepo {
  Future<Either<AppError, AppSuccess>> initLocalStorageDataSource();
}
