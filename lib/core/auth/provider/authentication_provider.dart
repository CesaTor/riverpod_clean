import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean/core/auth/model/user.dart';

part 'authentication_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  Jwt? build() => null;

  Future<bool> login() async {
    state = const Jwt(token: "aaaa");
    await Future.delayed(const Duration(seconds: 300));
    return true;
  }

  void logout() {
    state = null;
  }
}

extension InternetConnectionExt on WidgetRef {
  Jwt? get jwt => watch(authenticationProvider);
}
