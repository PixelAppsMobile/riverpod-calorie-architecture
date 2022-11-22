// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodEntryDto _$$_FoodEntryDtoFromJson(Map<String, dynamic> json) =>
    _$_FoodEntryDto(
      name: json['name'] as String,
      time: DateTime.parse(json['entry_time'] as String),
      calorificValue: (json['calorificValue'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      documentId: json['documentId'] as String?,
    );

Map<String, dynamic> _$$_FoodEntryDtoToJson(_$_FoodEntryDto instance) {
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

  writeNotNull('documentId', instance.documentId);
  return val;
}
