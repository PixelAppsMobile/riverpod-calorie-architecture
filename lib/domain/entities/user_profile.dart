// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/data/dto/user_profile_dto.dart';
import 'package:totaltest/domain/entities/food_entry.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required final bool isAdmin,
    required final double calorieLimit,
    required final String userId,
    final List<FoodEntry>? foodEntries,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

extension UserProfileEntityToDtoExtension on UserProfile {
  UserProfileDto get toDto => UserProfileDto(
        isAdmin: isAdmin,
        calorieLimit: calorieLimit,
        userId: userId,
      );
}
