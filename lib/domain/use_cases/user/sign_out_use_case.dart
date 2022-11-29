import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';

final signOutUseCase = Provider((ref) => SignOutUseCase(ref.read(authRepo)));

class SignOutUseCase implements NoParamUseCase<AppSuccess> {
  final AuthRepo _authRepo;

  SignOutUseCase(this._authRepo);

  @override
  Future<Either<AppError, AppSuccess>> call() => _authRepo.logOut();
}
