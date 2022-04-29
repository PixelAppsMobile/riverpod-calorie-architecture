// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodEntry _$$_FoodEntryFromJson(Map<String, dynamic> json) => _$_FoodEntry(
      name: json['name'] as String,
      time: DateTime.parse(json['entry_time'] as String),
      calorificValue: (json['calorificValue'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      documentID: json['documentID'] as String?,
    );

Map<String, dynamic> _$$_FoodEntryToJson(_$_FoodEntry instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'entry_time': instance.time.toIso8601String(),
    'calorificValue': instance.calorificValue,
    'imageUrl': instance.imageUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('documentID', instance.documentID);
  return val;
}
