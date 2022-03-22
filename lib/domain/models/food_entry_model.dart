// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_entry_model.freezed.dart';
part 'food_entry_model.g.dart';

@freezed
class FoodEntry with _$FoodEntry {
  const factory FoodEntry(
      {required final String name,
      @JsonKey(name: "entry_time") required final DateTime time,
      required final double calorificValue,
      final String? imageUrl,
      @JsonKey(includeIfNull: false) final String? documentID}) = _FoodEntry;

  factory FoodEntry.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryFromJson(json);
}
