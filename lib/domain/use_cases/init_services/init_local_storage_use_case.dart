import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/domain/repositories/init_services/init_services_repo.dart';

final initLocalStorageUseCase =
    Provider((ref) => InitLocalStorageUseCase(ref.read(initServicesRepo)));

class InitLocalStorageUseCase implements NoParamUseCase<AppSuccess> {
  final InitServicesRepo _initServicesRepo;

  InitLocalStorageUseCase(this._initServicesRepo);

  @override
  Future<Either<AppError, AppSuccess>> call() =>
      _initServicesRepo.initLocalStorageDataSource();
}
