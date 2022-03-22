import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/helper/prefs_helper/shared_prefs_helper.dart';
import 'package:totaltest/data/repo/auth_repo/auth_repo_impl.dart';
import 'package:totaltest/domain/models/app_user.dart';

final authRepo = Provider.autoDispose((ref) => AuthRepoImpl(ref.read(prefs)));

abstract class AuthRepo {
  Future<Either<AppError, User>> signInUsingCustomToken(String customToken);
  AppUser getAppUser();
  Future<void> logOut();
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid);
}
