import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totaltest/core/constants/firestore_strings.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/domain/repositories/admin/admin_repo.dart';
import 'package:totaltest/domain/extenstions/export.dart';

class AdminRepoImpl implements AdminRepo {
  @override
  Future<List<UserProfileDto>> fetchAllUsers() async {
    final snapshots = await FirebaseFirestore.instance
        .collection(FirestoreStrings.usersCollection)
        .get();
    return snapshots.docs
        .map<UserProfileDto>((e) => e.userProfileFromDocSnapshot)
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
