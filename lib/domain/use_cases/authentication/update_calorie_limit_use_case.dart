import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';

final updateCalorieLimitUseCase =
    Provider((ref) => UpdateCalorieLimitUseCase(ref.read(authRepo)));

class UpdateCalorieLimitUseCase
    implements UseCase<AppSuccess, UpdateCalorieLimitUseCaseParam> {
  final AuthRepo _authRepo;

  UpdateCalorieLimitUseCase(this._authRepo);

  @override
  Future<Either<AppError, AppSuccess>> call(
      UpdateCalorieLimitUseCaseParam param) async {
    return _authRepo.updateCalorieLimit(param.limit, param.uid);
  }
}

class UpdateCalorieLimitUseCaseParam {
  final double limit;
  final String uid;

  UpdateCalorieLimitUseCaseParam(this.limit, this.uid);
}
