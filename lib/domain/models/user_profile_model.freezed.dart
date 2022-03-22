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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
class _$UserProfileTearOff {
  const _$UserProfileTearOff();

  _UserProfile call(
      {@JsonKey(name: FirestoreStrings.isAdmin)
          required bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit)
          required double calorieLimit,
      @JsonKey(name: "user_id")
          required String userID,
      List<FoodEntry>? foodEntries}) {
    return _UserProfile(
      isAdmin: isAdmin,
      calorieLimit: calorieLimit,
      userID: userID,
      foodEntries: foodEntries,
    );
  }

  UserProfile fromJson(Map<String, Object?> json) {
    return UserProfile.fromJson(json);
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

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
      _$UserProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: FirestoreStrings.isAdmin) bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit) double calorieLimit,
      @JsonKey(name: "user_id") String userID,
      List<FoodEntry>? foodEntries});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;

  @override
  $Res call({
    Object? isAdmin = freezed,
    Object? calorieLimit = freezed,
    Object? userID = freezed,
    Object? foodEntries = freezed,
  }) {
    return _then(_value.copyWith(
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      calorieLimit: calorieLimit == freezed
          ? _value.calorieLimit
          : calorieLimit // ignore: cast_nullable_to_non_nullable
              as double,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      foodEntries: foodEntries == freezed
          ? _value.foodEntries
          : foodEntries // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>?,
    ));
  }
}

/// @nodoc
abstract class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) then) =
      __$UserProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: FirestoreStrings.isAdmin) bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit) double calorieLimit,
      @JsonKey(name: "user_id") String userID,
      List<FoodEntry>? foodEntries});
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(
      _UserProfile _value, $Res Function(_UserProfile) _then)
      : super(_value, (v) => _then(v as _UserProfile));

  @override
  _UserProfile get _value => super._value as _UserProfile;

  @override
  $Res call({
    Object? isAdmin = freezed,
    Object? calorieLimit = freezed,
    Object? userID = freezed,
    Object? foodEntries = freezed,
  }) {
    return _then(_UserProfile(
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      calorieLimit: calorieLimit == freezed
          ? _value.calorieLimit
          : calorieLimit // ignore: cast_nullable_to_non_nullable
              as double,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      foodEntries: foodEntries == freezed
          ? _value.foodEntries
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
      this.foodEntries});

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
  @override
  final List<FoodEntry>? foodEntries;

  @override
  String toString() {
    return 'UserProfile(isAdmin: $isAdmin, calorieLimit: $calorieLimit, userID: $userID, foodEntries: $foodEntries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
            const DeepCollectionEquality().equals(other.isAdmin, isAdmin) &&
            const DeepCollectionEquality()
                .equals(other.calorieLimit, calorieLimit) &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality()
                .equals(other.foodEntries, foodEntries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAdmin),
      const DeepCollectionEquality().hash(calorieLimit),
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(foodEntries));

  @JsonKey(ignore: true)
  @override
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(this);
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {@JsonKey(name: FirestoreStrings.isAdmin)
          required bool isAdmin,
      @JsonKey(name: FirestoreStrings.calorieLimit)
          required double calorieLimit,
      @JsonKey(name: "user_id")
          required String userID,
      List<FoodEntry>? foodEntries}) = _$_UserProfile;

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
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
