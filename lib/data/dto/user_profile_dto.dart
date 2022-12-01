// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/core/constants/firestore_constants.dart';
import 'package:totaltest/domain/entities/food_entry.dart';
import 'package:totaltest/domain/entities/user_profile.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
class UserProfileDto with _$UserProfileDto {
  const factory UserProfileDto(
      {@JsonKey(name: FirestoreConstants.isAdmin)
          required final bool isAdmin,
      @JsonKey(name: FirestoreConstants.calorieLimit)
          required final double calorieLimit,
      @JsonKey(name: FirestoreConstants.userId)
          required final String userId,
      final List<FoodEntry>? foodEntries}) = _UserProfileDto;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
}

extension UserProfileDtoToEntityExtension on UserProfileDto {
  UserProfile get toEntity => UserProfile(
        isAdmin: isAdmin,
        calorieLimit: calorieLimit,
        userId: userId,
      );
}
