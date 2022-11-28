// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_entry_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodEntryDto _$FoodEntryDtoFromJson(Map<String, dynamic> json) {
  return _FoodEntryDto.fromJson(json);
}

/// @nodoc
mixin _$FoodEntryDto {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "entry_time")
  DateTime get time => throw _privateConstructorUsedError;
  double get calorificValue => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "document_id")
  String? get documentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodEntryDtoCopyWith<FoodEntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntryDtoCopyWith<$Res> {
  factory $FoodEntryDtoCopyWith(
          FoodEntryDto value, $Res Function(FoodEntryDto) then) =
      _$FoodEntryDtoCopyWithImpl<$Res, FoodEntryDto>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: "entry_time") DateTime time,
      double calorificValue,
      String? imageUrl,
      @JsonKey(name: "document_id") String? documentId});
}

/// @nodoc
class _$FoodEntryDtoCopyWithImpl<$Res, $Val extends FoodEntryDto>
    implements $FoodEntryDtoCopyWith<$Res> {
  _$FoodEntryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? time = null,
    Object? calorificValue = null,
    Object? imageUrl = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calorificValue: null == calorificValue
          ? _value.calorificValue
          : calorificValue // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodEntryDtoCopyWith<$Res>
    implements $FoodEntryDtoCopyWith<$Res> {
  factory _$$_FoodEntryDtoCopyWith(
          _$_FoodEntryDto value, $Res Function(_$_FoodEntryDto) then) =
      __$$_FoodEntryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: "entry_time") DateTime time,
      double calorificValue,
      String? imageUrl,
      @JsonKey(name: "document_id") String? documentId});
}

/// @nodoc
class __$$_FoodEntryDtoCopyWithImpl<$Res>
    extends _$FoodEntryDtoCopyWithImpl<$Res, _$_FoodEntryDto>
    implements _$$_FoodEntryDtoCopyWith<$Res> {
  __$$_FoodEntryDtoCopyWithImpl(
      _$_FoodEntryDto _value, $Res Function(_$_FoodEntryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? time = null,
    Object? calorificValue = null,
    Object? imageUrl = freezed,
    Object? documentId = freezed,
  }) {
    return _then(_$_FoodEntryDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calorificValue: null == calorificValue
          ? _value.calorificValue
          : calorificValue // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      documentId: freezed == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodEntryDto implements _FoodEntryDto {
  const _$_FoodEntryDto(
      {required this.name,
      @JsonKey(name: "entry_time") required this.time,
      required this.calorificValue,
      this.imageUrl,
      @JsonKey(name: "document_id") this.documentId});

  factory _$_FoodEntryDto.fromJson(Map<String, dynamic> json) =>
      _$$_FoodEntryDtoFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: "entry_time")
  final DateTime time;
  @override
  final double calorificValue;
  @override
  final String? imageUrl;
  @override
  @JsonKey(name: "document_id")
  final String? documentId;

  @override
  String toString() {
    return 'FoodEntryDto(name: $name, time: $time, calorificValue: $calorificValue, imageUrl: $imageUrl, documentId: $documentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodEntryDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.calorificValue, calorificValue) ||
                other.calorificValue == calorificValue) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, time, calorificValue, imageUrl, documentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodEntryDtoCopyWith<_$_FoodEntryDto> get copyWith =>
      __$$_FoodEntryDtoCopyWithImpl<_$_FoodEntryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodEntryDtoToJson(
      this,
    );
  }
}

abstract class _FoodEntryDto implements FoodEntryDto {
  const factory _FoodEntryDto(
          {required final String name,
          @JsonKey(name: "entry_time") required final DateTime time,
          required final double calorificValue,
          final String? imageUrl,
          @JsonKey(name: "document_id") final String? documentId}) =
      _$_FoodEntryDto;

  factory _FoodEntryDto.fromJson(Map<String, dynamic> json) =
      _$_FoodEntryDto.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: "entry_time")
  DateTime get time;
  @override
  double get calorificValue;
  @override
  String? get imageUrl;
  @override
  @JsonKey(name: "document_id")
  String? get documentId;
  @override
  @JsonKey(ignore: true)
  _$$_FoodEntryDtoCopyWith<_$_FoodEntryDto> get copyWith =>
      throw _privateConstructorUsedError;
}
