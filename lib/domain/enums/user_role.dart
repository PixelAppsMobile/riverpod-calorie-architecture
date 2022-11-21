import 'package:freezed_annotation/freezed_annotation.dart';

enum UserRole {
  @JsonValue("normal")
  normal,
  @JsonValue("admin")
  admin
}
