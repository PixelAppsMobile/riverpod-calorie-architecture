// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppUserDto {
  BaseUserDto get user => throw _privateConstructorUsedError;
  UserRole? get role => throw _privateConstructorUsedError;
  double? get calorieLimit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUserDtoCopyWith<AppUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserDtoCopyWith<$Res> {
  factory $AppUserDtoCopyWith(
          AppUserDto value, $Res Function(AppUserDto) then) =
      _$AppUserDtoCopyWithImpl<$Res, AppUserDto>;
  @useResult
  $Res call({BaseUserDto user, UserRole? role, double? calorieLimit});

  $BaseUserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$AppUserDtoCopyWithImpl<$Res, $Val extends AppUserDto>
    implements $AppUserDtoCopyWith<$Res> {
  _$AppUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? role = freezed,
    Object? calorieLimit = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as BaseUserDto,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      calorieLimit: freezed == calorieLimit
          ? _value.calorieLimit
          : calorieLimit // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BaseUserDtoCopyWith<$Res> get user {
    return $BaseUserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppUserDtoCopyWith<$Res>
    implements $AppUserDtoCopyWith<$Res> {
  factory _$$_AppUserDtoCopyWith(
          _$_AppUserDto value, $Res Function(_$_AppUserDto) then) =
      __$$_AppUserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseUserDto user, UserRole? role, double? calorieLimit});

  @override
  $BaseUserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AppUserDtoCopyWithImpl<$Res>
    extends _$AppUserDtoCopyWithImpl<$Res, _$_AppUserDto>
    implements _$$_AppUserDtoCopyWith<$Res> {
  __$$_AppUserDtoCopyWithImpl(
      _$_AppUserDto _value, $Res Function(_$_AppUserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? role = freezed,
    Object? calorieLimit = freezed,
  }) {
    return _then(_$_AppUserDto(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as BaseUserDto,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      calorieLimit: freezed == calorieLimit
          ? _value.calorieLimit
          : calorieLimit // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_AppUserDto implements _AppUserDto {
  const _$_AppUserDto(
      {required this.user, this.role, this.calorieLimit = 2100.0});

  @override
  final BaseUserDto user;
  @override
  final UserRole? role;
  @override
  @JsonKey()
  final double? calorieLimit;

  @override
  String toString() {
    return 'AppUserDto(user: $user, role: $role, calorieLimit: $calorieLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUserDto &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.calorieLimit, calorieLimit) ||
                other.calorieLimit == calorieLimit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, role, calorieLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserDtoCopyWith<_$_AppUserDto> get copyWith =>
      __$$_AppUserDtoCopyWithImpl<_$_AppUserDto>(this, _$identity);
}

abstract class _AppUserDto implements AppUserDto {
  const factory _AppUserDto(
      {required final BaseUserDto user,
      final UserRole? role,
      final double? calorieLimit}) = _$_AppUserDto;

  @override
  BaseUserDto get user;
  @override
  UserRole? get role;
  @override
  double? get calorieLimit;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserDtoCopyWith<_$_AppUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
