import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class Jwt with _$Jwt {
  const factory Jwt({
    required String token,
  }) = _Jwt;

  factory Jwt.fromJson(Map<String, dynamic> json) => _$JwtFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    required Jwt jwt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
