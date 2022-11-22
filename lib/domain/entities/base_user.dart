import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/data/dto/base_user_dto.dart';

part 'base_user.freezed.dart';

@freezed
class BaseUser with _$BaseUser {
  const factory BaseUser({required final String uid}) = _BaseUser;
}

extension BaseUserEntityToDtoExtension on BaseUser {
  BaseUserDto get toDto => BaseUserDto(
        uid: uid,
      );
}
