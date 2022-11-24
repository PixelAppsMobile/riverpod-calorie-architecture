import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/dto/base_user_dto.dart';
import 'package:totaltest/domain/data_sources/remote/authentication/authentication_data_source.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  BaseUserDto? get currentUser {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return BaseUserDto(uid: user.uid);
    }
    return null;
  }

  @override
  Future<Either<AppError, BaseUserDto>> signInUsingCustomToken(
      String token) async {
    try {
      final userCred = await _firebaseAuth.signInWithCustomToken(token);
      if (userCred.user != null) {
        return Right(BaseUserDto(uid: userCred.user!.uid));
      } else {
        return Left(AppError(title: "User is null"));
      }
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, AppSuccess>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Right(AppSuccess());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
