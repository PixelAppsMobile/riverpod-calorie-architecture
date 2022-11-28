import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';

extension QuerySnapshotExt on QuerySnapshot {
  List<FoodEntryDto> get foodEntriesFromSnapshot => docs
      .map((e) => FoodEntryDto.fromJson(
          (e.data() as Map<String, dynamic>)..addAll({'document_id': e.id})))
      .toList();
}

extension QueryDocSnapshotExt on QueryDocumentSnapshot {
  UserProfileDto get userProfileFromDocSnapshot => UserProfileDto.fromJson(
      (data() as Map<String, dynamic>)..addAll({'user_id': id}));
}
