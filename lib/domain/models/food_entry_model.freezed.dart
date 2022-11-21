// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'food_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodEntry _$FoodEntryFromJson(Map<String, dynamic> json) {
  return _FoodEntry.fromJson(json);
}

/// @nodoc
mixin _$FoodEntry {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "entry_time")
  DateTime get time => throw _privateConstructorUsedError;
  double get calorificValue => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get documentID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodEntryCopyWith<FoodEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntryCopyWith<$Res> {
  factory $FoodEntryCopyWith(FoodEntry value, $Res Function(FoodEntry) then) =
      _$FoodEntryCopyWithImpl<$Res, FoodEntry>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: "entry_time") DateTime time,
      double calorificValue,
      String? imageUrl,
      @JsonKey(includeIfNull: false) String? documentID});
}

/// @nodoc
class _$FoodEntryCopyWithImpl<$Res, $Val extends FoodEntry>
    implements $FoodEntryCopyWith<$Res> {
  _$FoodEntryCopyWithImpl(this._value, this._then);

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
    Object? documentID = freezed,
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
      documentID: freezed == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodEntryCopyWith<$Res> implements $FoodEntryCopyWith<$Res> {
  factory _$$_FoodEntryCopyWith(
          _$_FoodEntry value, $Res Function(_$_FoodEntry) then) =
      __$$_FoodEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: "entry_time") DateTime time,
      double calorificValue,
      String? imageUrl,
      @JsonKey(includeIfNull: false) String? documentID});
}

/// @nodoc
class __$$_FoodEntryCopyWithImpl<$Res>
    extends _$FoodEntryCopyWithImpl<$Res, _$_FoodEntry>
    implements _$$_FoodEntryCopyWith<$Res> {
  __$$_FoodEntryCopyWithImpl(
      _$_FoodEntry _value, $Res Function(_$_FoodEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? time = null,
    Object? calorificValue = null,
    Object? imageUrl = freezed,
    Object? documentID = freezed,
  }) {
    return _then(_$_FoodEntry(
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
      documentID: freezed == documentID
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodEntry implements _FoodEntry {
  const _$_FoodEntry(
      {required this.name,
      @JsonKey(name: "entry_time") required this.time,
      required this.calorificValue,
      this.imageUrl,
      @JsonKey(includeIfNull: false) this.documentID});

  factory _$_FoodEntry.fromJson(Map<String, dynamic> json) =>
      _$$_FoodEntryFromJson(json);

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
  @JsonKey(includeIfNull: false)
  final String? documentID;

  @override
  String toString() {
    return 'FoodEntry(name: $name, time: $time, calorificValue: $calorificValue, imageUrl: $imageUrl, documentID: $documentID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodEntry &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.calorificValue, calorificValue) ||
                other.calorificValue == calorificValue) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.documentID, documentID) ||
                other.documentID == documentID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, time, calorificValue, imageUrl, documentID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodEntryCopyWith<_$_FoodEntry> get copyWith =>
      __$$_FoodEntryCopyWithImpl<_$_FoodEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodEntryToJson(
      this,
    );
  }
}

abstract class _FoodEntry implements FoodEntry {
  const factory _FoodEntry(
      {required final String name,
      @JsonKey(name: "entry_time") required final DateTime time,
      required final double calorificValue,
      final String? imageUrl,
      @JsonKey(includeIfNull: false) final String? documentID}) = _$_FoodEntry;

  factory _FoodEntry.fromJson(Map<String, dynamic> json) =
      _$_FoodEntry.fromJson;

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
  @JsonKey(includeIfNull: false)
  String? get documentID;
  @override
  @JsonKey(ignore: true)
  _$$_FoodEntryCopyWith<_$_FoodEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
