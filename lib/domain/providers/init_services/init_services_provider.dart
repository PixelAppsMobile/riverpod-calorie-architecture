import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/domain/use_cases/init_services/init_local_storage_use_case.dart';

final initServicesProvider = Provider(
  (ref) => InitServicesProvider(
    null,
    ref.read(initLocalStorageUseCase),
  ),
);

class InitServicesProvider {
  final InitLocalStorageUseCase _initLocalStorageUseCase;

  InitServicesProvider(
    void state,
    this._initLocalStorageUseCase,
  );

  Future<Either<AppError, AppSuccess>> initialise() async {
    return _initLocalStorageUseCase();
  }
}
