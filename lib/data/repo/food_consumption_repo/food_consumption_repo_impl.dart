import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:totaltest/core/firestore_strings.dart';
import 'package:totaltest/core/result_type.dart';
import 'package:totaltest/data/repo/food_consumption_repo/food_consumption_repo.dart';
import 'package:totaltest/domain/extenstions/export.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';

class FoodConsumptionRepoImpl implements FoodConsumptionRepo {
  final String uid;
  final FirebaseFirestore firestore;
  FoodConsumptionRepoImpl(this.uid, this.firestore);
  @override
  Future<Either<AppError, FoodEntry>> addFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID == null);

    final reference = await firestore
        .collection(FirestoreStrings.usersCollection)
        .doc(overrideUid ?? uid)
        .collection(FirestoreStrings.foodEntryCollection)
        .add(entry.toJson());
    final document = await reference.get();
    return Right(FoodEntry.fromJson(document.dataWithDocID));
  }

  @override
  Future<List<FoodEntry>> getFoodEntries({String? overrideUid}) async {
    final snapshot = await firestore
        .collection(FirestoreStrings.usersCollection)
        .doc(overrideUid ?? uid)
        .collection(FirestoreStrings.foodEntryCollection)
        .orderBy("entry_time", descending: true)
        .get();

    return snapshot.foodEntriesFromSnapshot;
  }

  @override
  Future<Either<AppError, void>> updateFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID != null);
    await firestore
        .collection(FirestoreStrings.usersCollection)
        .doc(overrideUid ?? uid)
        .collection(FirestoreStrings.foodEntryCollection)
        .doc(entry.documentID)
        .set(entry.toJson().stripDocID);
    return const Right(null);
  }

  @override
  Future<Either<AppError, void>> deleteFoodEntry(FoodEntry entry,
      {String? overrideUid}) async {
    assert(entry.documentID != null);
    await firestore
        .collection(FirestoreStrings.usersCollection)
        .doc(overrideUid ?? uid)
        .collection(FirestoreStrings.foodEntryCollection)
        .doc(entry.documentID)
        .delete();
    return const Right(null);
  }
}
