import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/data/dto/app_user_dto.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/repositories/authentication/auth_repo.dart';

final getAppUserUseCase =
    Provider((ref) => GetAppUserUseCase(ref.read(authRepo)));

class GetAppUserUseCase implements NoParamUseCaseSimple<AppUser> {
  final AuthRepo _authRepo;

  GetAppUserUseCase(this._authRepo);

  @override
  AppUser call() => _authRepo.getAppUser.toEntity;
}
