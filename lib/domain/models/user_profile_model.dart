// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/core/constants/firestore_strings.dart';
import 'package:totaltest/domain/models/food_entry_model.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile(
      {@JsonKey(name: FirestoreStrings.isAdmin)
          required final bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit)
          required final double calorieLimit,
      @JsonKey(name: "user_id")
          required final String userID,
      final List<FoodEntry>? foodEntries}) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
