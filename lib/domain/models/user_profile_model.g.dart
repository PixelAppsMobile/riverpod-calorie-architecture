// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      isAdmin: json['is_admin'] as bool,
      calorieLimit: (json['calorie_limit'] as num).toDouble(),
      userID: json['user_id'] as String,
      foodEntries: (json['foodEntries'] as List<dynamic>?)
          ?.map((e) => FoodEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'is_admin': instance.isAdmin,
      'calorie_limit': instance.calorieLimit,
      'user_id': instance.userID,
      'foodEntries': instance.foodEntries,
    };
