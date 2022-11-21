// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodEntry _$$_FoodEntryFromJson(Map<String, dynamic> json) => _$_FoodEntry(
      name: json['name'] as String,
      time: DateTime.parse(json['time'] as String),
      calorificValue: (json['calorificValue'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      documentID: json['documentID'] as String?,
    );

Map<String, dynamic> _$$_FoodEntryToJson(_$_FoodEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'time': instance.time.toIso8601String(),
      'calorificValue': instance.calorificValue,
      'imageUrl': instance.imageUrl,
      'documentID': instance.documentID,
    };
