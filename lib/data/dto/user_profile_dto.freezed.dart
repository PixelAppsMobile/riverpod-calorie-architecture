// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) {
  return _UserProfileDto.fromJson(json);
}

/// @nodoc
mixin _$UserProfileDto {
  @JsonKey(name: FirestoreConstants.isAdmin)
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: FirestoreConstants.calorieLimit)
  double get calorieLimit => throw _privateConstructorUsedError;
  @JsonKey(name: FirestoreConstants.userId)
  String get userId => throw _privateConstructorUsedError;
  List<FoodEntry>? get foodEntries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileDtoCopyWith<UserProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDtoCopyWith<$Res> {
  factory $UserProfileDtoCopyWith(
          UserProfileDto value, $Res Function(UserProfileDto) then) =
      _$UserProfileDtoCopyWithImpl<$Res, UserProfileDto>;
  @useResult
  $Res call(
      {@JsonKey(name: FirestoreConstants.isAdmin) bool isAdmin,
      @JsonKey(name: FirestoreConstants.calorieLimit) double calorieLimit,
      @JsonKey(name: FirestoreConstants.userId) String userId,
      List<FoodEntry>? foodEntries});
}

/// @nodoc
class _$UserProfileDtoCopyWithImpl<$Res, $Val extends UserProfileDto>
    implements $UserProfileDtoCopyWith<$Res> {
  _$UserProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdmin = null,
    Object? calorieLimit = null,
    Object? userId = null,
    Object? foodEntries = freezed,
  }) {
    return _then(_value.copyWith(
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      calorieLimit: null == calorieLimit
          ? _value.calorieLimit
          : calorieLimit // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      foodEntries: freezed == foodEntries
          ? _value.foodEntries
          : foodEntries // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileDtoCopyWith<$Res>
    implements $UserProfileDtoCopyWith<$Res> {
  factory _$$_UserProfileDtoCopyWith(
          _$_UserProfileDto value, $Res Function(_$_UserProfileDto) then) =
      __$$_UserProfileDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: FirestoreConstants.isAdmin) bool isAdmin,
      @JsonKey(name: FirestoreConstants.calorieLimit) double calorieLimit,
      @JsonKey(name: FirestoreConstants.userId) String userId,
      List<FoodEntry>? foodEntries});
}

/// @nodoc
class __$$_UserProfileDtoCopyWithImpl<$Res>
    extends _$UserProfileDtoCopyWithImpl<$Res, _$_UserProfileDto>
    implements _$$_UserProfileDtoCopyWith<$Res> {
  __$$_UserProfileDtoCopyWithImpl(
      _$_UserProfileDto _value, $Res Function(_$_UserProfileDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdmin = null,
    Object? calorieLimit = null,
    Object? userId = null,
    Object? foodEntries = freezed,
  }) {
    return _then(_$_UserProfileDto(
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      calorieLimit: null == calorieLimit
          ? _value.calorieLimit
          : calorieLimit // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      foodEntries: freezed == foodEntries
          ? _value._foodEntries
          : foodEntries // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileDto implements _UserProfileDto {
  const _$_UserProfileDto(
      {@JsonKey(name: FirestoreConstants.isAdmin)
          required this.isAdmin,
      @JsonKey(name: FirestoreConstants.calorieLimit)
          required this.calorieLimit,
      @JsonKey(name: FirestoreConstants.userId)
          required this.userId,
      final List<FoodEntry>? foodEntries})
      : _foodEntries = foodEntries;

  factory _$_UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileDtoFromJson(json);

  @override
  @JsonKey(name: FirestoreConstants.isAdmin)
  final bool isAdmin;
  @override
  @JsonKey(name: FirestoreConstants.calorieLimit)
  final double calorieLimit;
  @override
  @JsonKey(name: FirestoreConstants.userId)
  final String userId;
  final List<FoodEntry>? _foodEntries;
  @override
  List<FoodEntry>? get foodEntries {
    final value = _foodEntries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserProfileDto(isAdmin: $isAdmin, calorieLimit: $calorieLimit, userId: $userId, foodEntries: $foodEntries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileDto &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.calorieLimit, calorieLimit) ||
                other.calorieLimit == calorieLimit) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._foodEntries, _foodEntries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isAdmin, calorieLimit, userId,
      const DeepCollectionEquality().hash(_foodEntries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileDtoCopyWith<_$_UserProfileDto> get copyWith =>
      __$$_UserProfileDtoCopyWithImpl<_$_UserProfileDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileDtoToJson(
      this,
    );
  }
}

abstract class _UserProfileDto implements UserProfileDto {
  const factory _UserProfileDto(
      {@JsonKey(name: FirestoreConstants.isAdmin)
          required final bool isAdmin,
      @JsonKey(name: FirestoreConstants.calorieLimit)
          required final double calorieLimit,
      @JsonKey(name: FirestoreConstants.userId)
          required final String userId,
      final List<FoodEntry>? foodEntries}) = _$_UserProfileDto;

  factory _UserProfileDto.fromJson(Map<String, dynamic> json) =
      _$_UserProfileDto.fromJson;

  @override
  @JsonKey(name: FirestoreConstants.isAdmin)
  bool get isAdmin;
  @override
  @JsonKey(name: FirestoreConstants.calorieLimit)
  double get calorieLimit;
  @override
  @JsonKey(name: FirestoreConstants.userId)
  String get userId;
  @override
  List<FoodEntry>? get foodEntries;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileDtoCopyWith<_$_UserProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}
