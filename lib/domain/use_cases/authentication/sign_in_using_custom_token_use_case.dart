import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/data/dto/base_user_dto.dart';
import 'package:totaltest/domain/entities/base_user.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';

final signInUsingCustomTokenUseCase =
    Provider((ref) => SignInUsingCustomTokenUseCase(ref.read(authRepo)));

class SignInUsingCustomTokenUseCase implements UseCase<BaseUser, String> {
  final AuthRepo _authRepo;

  SignInUsingCustomTokenUseCase(this._authRepo);

  @override
  Future<Either<AppError, BaseUser>> call(String param) async {
    final result = await _authRepo.signInUsingCustomToken(param);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity),
    );
  }
}
