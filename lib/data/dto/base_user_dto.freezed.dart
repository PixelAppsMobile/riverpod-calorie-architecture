// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseUserDto {
  String get uid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseUserDtoCopyWith<BaseUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseUserDtoCopyWith<$Res> {
  factory $BaseUserDtoCopyWith(
          BaseUserDto value, $Res Function(BaseUserDto) then) =
      _$BaseUserDtoCopyWithImpl<$Res, BaseUserDto>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class _$BaseUserDtoCopyWithImpl<$Res, $Val extends BaseUserDto>
    implements $BaseUserDtoCopyWith<$Res> {
  _$BaseUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseUserDtoCopyWith<$Res>
    implements $BaseUserDtoCopyWith<$Res> {
  factory _$$_BaseUserDtoCopyWith(
          _$_BaseUserDto value, $Res Function(_$_BaseUserDto) then) =
      __$$_BaseUserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$_BaseUserDtoCopyWithImpl<$Res>
    extends _$BaseUserDtoCopyWithImpl<$Res, _$_BaseUserDto>
    implements _$$_BaseUserDtoCopyWith<$Res> {
  __$$_BaseUserDtoCopyWithImpl(
      _$_BaseUserDto _value, $Res Function(_$_BaseUserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$_BaseUserDto(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BaseUserDto implements _BaseUserDto {
  const _$_BaseUserDto({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'BaseUserDto(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseUserDto &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseUserDtoCopyWith<_$_BaseUserDto> get copyWith =>
      __$$_BaseUserDtoCopyWithImpl<_$_BaseUserDto>(this, _$identity);
}

abstract class _BaseUserDto implements BaseUserDto {
  const factory _BaseUserDto({required final String uid}) = _$_BaseUserDto;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_BaseUserDtoCopyWith<_$_BaseUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
