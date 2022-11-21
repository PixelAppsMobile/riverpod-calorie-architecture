// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @JsonKey(name: FirestoreStrings.isAdmin)
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: FirestoreStrings.calorieLimit)
  double get calorieLimit => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userID => throw _privateConstructorUsedError;
  List<FoodEntry>? get foodEntries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: FirestoreStrings.isAdmin) bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit) double calorieLimit,
      @JsonKey(name: "user_id") String userID,
      List<FoodEntry>? foodEntries});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdmin = null,
    Object? calorieLimit = null,
    Object? userID = null,
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
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      foodEntries: freezed == foodEntries
          ? _value.foodEntries
          : foodEntries // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: FirestoreStrings.isAdmin) bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit) double calorieLimit,
      @JsonKey(name: "user_id") String userID,
      List<FoodEntry>? foodEntries});
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdmin = null,
    Object? calorieLimit = null,
    Object? userID = null,
    Object? foodEntries = freezed,
  }) {
    return _then(_$_UserProfile(
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      calorieLimit: null == calorieLimit
          ? _value.calorieLimit
          : calorieLimit // ignore: cast_nullable_to_non_nullable
              as double,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
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
class _$_UserProfile implements _UserProfile {
  const _$_UserProfile(
      {@JsonKey(name: FirestoreStrings.isAdmin) required this.isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit) required this.calorieLimit,
      @JsonKey(name: "user_id") required this.userID,
      final List<FoodEntry>? foodEntries})
      : _foodEntries = foodEntries;

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  @JsonKey(name: FirestoreStrings.isAdmin)
  final bool isAdmin;
  @override
  @JsonKey(name: FirestoreStrings.calorieLimit)
  final double calorieLimit;
  @override
  @JsonKey(name: "user_id")
  final String userID;
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
    return 'UserProfile(isAdmin: $isAdmin, calorieLimit: $calorieLimit, userID: $userID, foodEntries: $foodEntries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.calorieLimit, calorieLimit) ||
                other.calorieLimit == calorieLimit) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            const DeepCollectionEquality()
                .equals(other._foodEntries, _foodEntries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isAdmin, calorieLimit, userID,
      const DeepCollectionEquality().hash(_foodEntries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {@JsonKey(name: FirestoreStrings.isAdmin)
          required final bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit)
          required final double calorieLimit,
      @JsonKey(name: "user_id")
          required final String userID,
      final List<FoodEntry>? foodEntries}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  @JsonKey(name: FirestoreStrings.isAdmin)
  bool get isAdmin;
  @override
  @JsonKey(name: FirestoreStrings.calorieLimit)
  double get calorieLimit;
  @override
  @JsonKey(name: "user_id")
  String get userID;
  @override
  List<FoodEntry>? get foodEntries;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
