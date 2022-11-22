import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/data/dto/app_user_dto.dart';
import 'package:totaltest/domain/entities/base_user.dart';
import 'package:totaltest/domain/enums/user_role.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required final BaseUser user,
    final UserRole? role,
    @Default(2100.0) final double? calorieLimit,
  }) = _AppUser;
}

extension AppUserEntityToDtoExtension on AppUser {
  AppUserDto get toDto => AppUserDto(
        user: user.toDto,
        role: role,
        calorieLimit: calorieLimit,
      );
}
