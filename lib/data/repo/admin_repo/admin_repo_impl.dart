import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totaltest/core/firestore_strings.dart';
import 'package:totaltest/data/repo/admin_repo/admin_repo.dart';
import 'package:totaltest/domain/extenstions/export.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';

class AdminRepoImpl implements AdminRepo {
  @override
  Future<List<UserProfile>> fetchAllUsers() async {
    final snapshots = await FirebaseFirestore.instance
        .collection(FirestoreStrings.usersCollection)
        .get();
    return snapshots.docs
        .map<UserProfile>((e) => e.userProfileFromDocSnapshot)
        .toList();
  }

  // @override
  // Future<List<FoodEntry>> getFoodEntriesForUser(UserProfile user) async {
  //   final snapshots = await FirebaseFirestore.instance
  //       .collection(FirestoreStrings.usersCollection)
  //       .doc(user.userID)
  //       .collection(FirestoreStrings.foodEntryCollection)
  //       .get();
  //   return snapshots.foodEntriesFromSnapshot;
  // }
}
