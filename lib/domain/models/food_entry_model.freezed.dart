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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodEntry _$FoodEntryFromJson(Map<String, dynamic> json) {
  return _FoodEntry.fromJson(json);
}

/// @nodoc
class _$FoodEntryTearOff {
  const _$FoodEntryTearOff();

  _FoodEntry call(
      {required String name,
      @JsonKey(name: "entry_time") required DateTime time,
      required double calorificValue,
      String? imageUrl,
      @JsonKey(includeIfNull: false) String? documentID}) {
    return _FoodEntry(
      name: name,
      time: time,
      calorificValue: calorificValue,
      imageUrl: imageUrl,
      documentID: documentID,
    );
  }

  FoodEntry fromJson(Map<String, Object?> json) {
    return FoodEntry.fromJson(json);
  }
}

/// @nodoc
const $FoodEntry = _$FoodEntryTearOff();

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
      _$FoodEntryCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @JsonKey(name: "entry_time") DateTime time,
      double calorificValue,
      String? imageUrl,
      @JsonKey(includeIfNull: false) String? documentID});
}

/// @nodoc
class _$FoodEntryCopyWithImpl<$Res> implements $FoodEntryCopyWith<$Res> {
  _$FoodEntryCopyWithImpl(this._value, this._then);

  final FoodEntry _value;
  // ignore: unused_field
  final $Res Function(FoodEntry) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? time = freezed,
    Object? calorificValue = freezed,
    Object? imageUrl = freezed,
    Object? documentID = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calorificValue: calorificValue == freezed
          ? _value.calorificValue
          : calorificValue // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      documentID: documentID == freezed
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$FoodEntryCopyWith<$Res> implements $FoodEntryCopyWith<$Res> {
  factory _$FoodEntryCopyWith(
          _FoodEntry value, $Res Function(_FoodEntry) then) =
      __$FoodEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @JsonKey(name: "entry_time") DateTime time,
      double calorificValue,
      String? imageUrl,
      @JsonKey(includeIfNull: false) String? documentID});
}

/// @nodoc
class __$FoodEntryCopyWithImpl<$Res> extends _$FoodEntryCopyWithImpl<$Res>
    implements _$FoodEntryCopyWith<$Res> {
  __$FoodEntryCopyWithImpl(_FoodEntry _value, $Res Function(_FoodEntry) _then)
      : super(_value, (v) => _then(v as _FoodEntry));

  @override
  _FoodEntry get _value => super._value as _FoodEntry;

  @override
  $Res call({
    Object? name = freezed,
    Object? time = freezed,
    Object? calorificValue = freezed,
    Object? imageUrl = freezed,
    Object? documentID = freezed,
  }) {
    return _then(_FoodEntry(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calorificValue: calorificValue == freezed
          ? _value.calorificValue
          : calorificValue // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      documentID: documentID == freezed
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
            other is _FoodEntry &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.calorificValue, calorificValue) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.documentID, documentID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(calorificValue),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(documentID));

  @JsonKey(ignore: true)
  @override
  _$FoodEntryCopyWith<_FoodEntry> get copyWith =>
      __$FoodEntryCopyWithImpl<_FoodEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodEntryToJson(this);
  }
}

abstract class _FoodEntry implements FoodEntry {
  const factory _FoodEntry(
      {required String name,
      @JsonKey(name: "entry_time") required DateTime time,
      required double calorificValue,
      String? imageUrl,
      @JsonKey(includeIfNull: false) String? documentID}) = _$_FoodEntry;

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
  _$FoodEntryCopyWith<_FoodEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
