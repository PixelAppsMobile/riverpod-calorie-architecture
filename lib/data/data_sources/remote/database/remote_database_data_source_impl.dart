import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/constants/firestore_strings.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/domain/data_sources/remote/database/remote_database_data_source.dart';
import 'package:totaltest/domain/extenstions/document_snaphot_extenstion.dart';
import 'package:totaltest/domain/extenstions/map_extensions.dart';
import 'package:totaltest/domain/extenstions/query_snapshot_extension.dart';

class RemoteDatabaseDataSourceImpl implements RemoteDatabaseDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<AppError, FoodEntryDto>> createFoodEntry(
      String uid, FoodEntryDto entry) async {
    try {
      final reference = await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .collection(FirestoreStrings.foodEntryCollection)
          .add(entry.toJson());
      final document = await reference.get();
      return Right(FoodEntryDto.fromJson(document.dataWithDocID));
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, AppSuccess>> deleteFoodEntry(
      String uid, String id) async {
    try {
      await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .collection(FirestoreStrings.foodEntryCollection)
          .doc(id)
          .delete();
      return Right(AppSuccess());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<FoodEntryDto>>> getFoodEntries(
      String uid) async {
    try {
      final snapshot = await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .collection(FirestoreStrings.foodEntryCollection)
          .orderBy("entry_time", descending: true)
          .get();

      return Right(snapshot.foodEntriesFromSnapshot);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Map<String, dynamic>>> getUser(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection(FirestoreStrings.usersCollection)
        .doc(uid)
        .get();
    return Right(doc.data()!);
  }

  @override
  Future<Either<AppError, AppSuccess>> updateCalorie(
      String uid, double calories) async {
    try {
      await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .update({FirestoreStrings.calorieLimit: calories});
      return Right(AppSuccess());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, AppSuccess>> updateFoodEntry(
      String uid, FoodEntryDto entry) async {
    try {
      await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .collection(FirestoreStrings.foodEntryCollection)
          .doc(entry.documentId)
          .update(entry.toJson().stripDocID);
      log("UPDATE COMPLETE");
      return Right(AppSuccess());
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<UserProfileDto>>> fetchAllUsers() async {
    try {
      final snapshots = await FirebaseFirestore.instance
          .collection(FirestoreStrings.usersCollection)
          .get();
      List<UserProfileDto> usersDtoList = snapshots.docs
          .map<UserProfileDto>((e) => e.userProfileFromDocSnapshot)
          .toList();

      return Right(usersDtoList);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
