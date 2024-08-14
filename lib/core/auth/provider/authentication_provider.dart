import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean/core/auth/model/user.dart';

part 'authentication_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  User? build() => null;

  Future<bool> login() async {
    await Future.delayed(const Duration(milliseconds: 300));

    state = const User(
      email: "email@email.com",
      id: "1",
      jwt: Jwt(token: "jwt"),
      name: "Name",
    );

    return true;
  }

  void logout() => state = null;
}

extension AuthContextExt on WidgetRef {
  Jwt? get jwt => watch(authenticationProvider)?.jwt;
}
