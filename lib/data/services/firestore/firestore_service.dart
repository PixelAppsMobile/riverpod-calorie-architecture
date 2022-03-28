import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totaltest/core/firestore_strings.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/data/services/firestore/database_service.dart';
import 'package:totaltest/domain/extenstions/export.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';

class FirestoreServiceImpl implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<AppError, FoodEntry>> createFoodEntry(
      String uid, FoodEntry entry) async {
    try {
      final reference = await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .collection(FirestoreStrings.foodEntryCollection)
          .add(entry.toJson());
      final document = await reference.get();
      return Right(FoodEntry.fromJson(document.dataWithDocID));
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFoodEntry(String uid, String id) async {
    try {
      await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .collection(FirestoreStrings.foodEntryCollection)
          .doc(id)
          .delete();
      return const Right(null);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<FoodEntry>>> getFoodEntries(String uid) async {
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
  Future<Either<AppError, void>> updateCalorie(
      String uid, double calories) async {
    try {
      await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .update({FirestoreStrings.calorieLimit: calories});
      return const Right(null);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> updateFoodEntry(
      String uid, FoodEntry entry) async {
    try {
      print("UPDATING FOOD ENTRY");
      print(entry.calorificValue);
      print(entry.documentID);
      await _firestore
          .collection(FirestoreStrings.usersCollection)
          .doc(uid)
          .collection(FirestoreStrings.foodEntryCollection)
          .doc(entry.documentID)
          .update(entry.toJson().stripDocID);
      print("UPDATE COMPLETE");
      return const Right(null);
    } catch (e) {
      return Left(AppError(title: e.toString()));
    }
  }
}
