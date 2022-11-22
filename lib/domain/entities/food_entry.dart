// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/data/dto/food_entry_dto.dart';

part 'food_entry.freezed.dart';
part 'food_entry.g.dart';

@freezed
class FoodEntry with _$FoodEntry {
  const factory FoodEntry({
    required final String name,
    required final DateTime time,
    required final double calorificValue,
    final String? imageUrl,
    final String? documentId,
  }) = _FoodEntry;

  factory FoodEntry.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryFromJson(json);
}

extension FoodEntryEntityToDtoExtension on FoodEntry {
  FoodEntryDto get toDto => FoodEntryDto(
        name: name,
        time: time,
        calorificValue: calorificValue,
        imageUrl: imageUrl,
        documentId: documentId,
      );
}
