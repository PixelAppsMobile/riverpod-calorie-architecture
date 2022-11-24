import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/domain/entities/base_user.dart';

part 'base_user_dto.freezed.dart';

@freezed
class BaseUserDto with _$BaseUserDto {
  const factory BaseUserDto({
    required final String uid,
  }) = _BaseUserDto;
}

extension BaseUserDtoToEntityExtension on BaseUserDto {
  BaseUser get toEntity => BaseUser(uid: uid);
}
