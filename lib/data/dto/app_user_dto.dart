import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:totaltest/data/dto/base_user_dto.dart';
import 'package:totaltest/domain/entities/app_user.dart';
import 'package:totaltest/domain/enums/user_role.dart';

part 'app_user_dto.freezed.dart';

@freezed
class AppUserDto with _$AppUserDto {
  const factory AppUserDto({
    required final BaseUserDto user,
    final UserRole? role,
    @Default(2100.0) final double? calorieLimit,
  }) = _AppUserDto;
}

extension AppUserDtoToEntityExtension on AppUserDto {
  AppUser get toEntity => AppUser(
        user: user.toEntity,
        role: role,
        calorieLimit: calorieLimit,
      );
}
