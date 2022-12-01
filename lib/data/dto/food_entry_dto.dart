import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/domain/entities/food_entry.dart';

part 'food_entry_dto.freezed.dart';
part 'food_entry_dto.g.dart';

@freezed
class FoodEntryDto with _$FoodEntryDto {
  const factory FoodEntryDto({
    required final String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: "entry_time") required final DateTime time,
    required final double calorificValue,
    final String? imageUrl,
    // ignore: invalid_annotation_target
    @JsonKey(name: "document_id") final String? documentId,
  }) = _FoodEntryDto;

  factory FoodEntryDto.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryDtoFromJson(json);
}

extension FoodEntryDtoToEntityExtension on FoodEntryDto {
  FoodEntry get toEntity => FoodEntry(
        name: name,
        time: time,
        calorificValue: calorificValue,
        imageUrl: imageUrl,
        documentId: documentId,
      );
}
