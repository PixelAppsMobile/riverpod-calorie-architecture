import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/domain/entities/food_entry.dart';

extension QuerySnapshotExt on QuerySnapshot {
  List<FoodEntry> get foodEntriesFromSnapshot => docs
      .map((e) => FoodEntry.fromJson(
          (e.data() as Map<String, dynamic>)..addAll({'documentID': e.id})))
      .toList();
}

extension QueryDocSnapshotExt on QueryDocumentSnapshot {
  UserProfileDto get userProfileFromDocSnapshot => UserProfileDto.fromJson(
      (data() as Map<String, dynamic>)..addAll({'user_id': id}));
}
