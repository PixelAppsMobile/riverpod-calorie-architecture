// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileDto _$$_UserProfileDtoFromJson(Map<String, dynamic> json) =>
    _$_UserProfileDto(
      isAdmin: json['is_admin'] as bool,
      calorieLimit: (json['calorie_limit'] as num).toDouble(),
      userId: json['user_id'] as String,
      foodEntries: (json['foodEntries'] as List<dynamic>?)
          ?.map((e) => FoodEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileDtoToJson(_$_UserProfileDto instance) =>
    <String, dynamic>{
      'is_admin': instance.isAdmin,
      'calorie_limit': instance.calorieLimit,
      'user_id': instance.userId,
      'foodEntries': instance.foodEntries,
    };
