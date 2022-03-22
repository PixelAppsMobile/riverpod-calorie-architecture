import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';
import 'package:totaltest/domain/models/user_profile_model.dart';

extension QuerySnapshotExt on QuerySnapshot {
  List<FoodEntry> get foodEntriesFromSnapshot => docs
      .map((e) => FoodEntry.fromJson(
          (e.data() as Map<String, dynamic>)..addAll({'documentID': e.id})))
      .toList();
}

extension QueryDocSnapshotExt on QueryDocumentSnapshot {
  UserProfile get userProfileFromDocSnapshot => UserProfile.fromJson(
      (data() as Map<String, dynamic>)..addAll({'user_id': id}));
}
