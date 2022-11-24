// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      isAdmin: json['isAdmin'] as bool,
      calorieLimit: (json['calorieLimit'] as num).toDouble(),
      userId: json['userId'] as String,
      foodEntries: (json['foodEntries'] as List<dynamic>?)
          ?.map((e) => FoodEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'isAdmin': instance.isAdmin,
      'calorieLimit': instance.calorieLimit,
      'userId': instance.userId,
      'foodEntries': instance.foodEntries,
    };
