import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/use_case.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/domain/entities/user_profile.dart';
import 'package:totaltest/domain/repositories/admin/admin_repo.dart';

final getAllUsersUseCase =
    Provider((ref) => GetAllUsersUseCase(ref.read(adminRepo)));

class GetAllUsersUseCase implements NoParamUseCase<List<UserProfile>> {
  final AdminRepo _adminRepo;

  GetAllUsersUseCase(this._adminRepo);

  @override
  Future<Either<AppError, List<UserProfile>>> call() async {
    final result = await _adminRepo.fetchAllUsers();
    return result.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity).toList().cast<UserProfile>()),
    );
  }
}
