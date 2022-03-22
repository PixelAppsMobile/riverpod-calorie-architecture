import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totaltest/core/firestore_strings.dart';
import 'package:totaltest/core/preference_strings.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/data/helper/prefs_helper/shared_prefs_helper.dart';
import 'package:totaltest/data/repo/auth_repo/auth_repo.dart';
import 'package:totaltest/domain/enums/user_role.dart';
import 'package:totaltest/domain/models/app_user.dart';

class AuthRepoImpl implements AuthRepo {
  final SharedPreferenceHelper _preferenceHelper;
  const AuthRepoImpl(this._preferenceHelper);
  @override
  AppUser getAppUser() {
    print(_preferenceHelper.getBool(SharedPreferences.isAdmit));
    return AppUser(
        user: FirebaseAuth.instance.currentUser,
        calorieLimit:
            _preferenceHelper.getDouble(SharedPreferences.calorieLimit) ??
                2100.0,
        role: (_preferenceHelper.getBool(SharedPreferences.isAdmit) ?? false)
            ? UserRole.Admin
            : UserRole.Normal);
  }

  @override
  Future<Either<AppError, User>> signInUsingCustomToken(
      String customToken) async {
    try {
      final userCred =
          await FirebaseAuth.instance.signInWithCustomToken(customToken);
      if (userCred.user != null) {
        final doc = await FirebaseFirestore.instance
            .collection(FirestoreStrings.usersCollection)
            .doc(userCred.user!.uid)
            .get();
        final bool isAdmin = doc.data()![FirestoreStrings.isAdmin];
        await _preferenceHelper.setBool(
            SharedPreferences.isAdmit, doc.data()![FirestoreStrings.isAdmin]);
        await _preferenceHelper.setDouble(SharedPreferences.calorieLimit,
            doc.data()![FirestoreStrings.calorieLimit]);
        return Right(userCred.user!);
      } else {
        return Left(AppError(title: "User is null"));
      }
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await _preferenceHelper.clearAll();
  }

  @override
  Future<Either<AppError, AppSuccess>> updateCalorieLimit(
      double calories, String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .update({FirestoreStrings.calorieLimit: calories});
      _preferenceHelper.setDouble(SharedPreferences.calorieLimit, calories);
      return Right(AppSuccess());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
