import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';

final signInUsingCustomTokenUseCase =
    Provider((ref) => SignInUsingCustomTokenUseCase(ref.read(authRepo)));

class SignInUsingCustomTokenUseCase implements UseCase<User, String> {
  final AuthRepo _authRepo;

  SignInUsingCustomTokenUseCase(this._authRepo);

  @override
  Future<Either<AppError, User>> call(String param) async =>
      _authRepo.signInUsingCustomToken(param);
}
