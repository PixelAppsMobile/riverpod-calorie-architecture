import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/domain/data_sources/local/storage/local_storage_data_source.dart';
import 'package:totaltest/domain/repositories/init_services/init_services_repo.dart';

class InitServicesRepoImpl implements InitServicesRepo {
  final LocalStorageDataSource _localStorageDataSource;

  InitServicesRepoImpl(this._localStorageDataSource);

  @override
  Future<Either<AppError, AppSuccess>> initLocalStorageDataSource() async =>
      _localStorageDataSource.init();
}
