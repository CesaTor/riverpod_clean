import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/auth/model/user.dart';
import 'package:riverpod_clean/core/auth/provider/authentication_provider.dart';
import 'package:riverpod_clean/core/router/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final WidgetRef _ref;
  AuthGuard(this._ref);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final token = _ref.watch(authenticationProvider)?.jwt;

    switch (token) {
      case null:
        router.push(const LoginRoute());
        break;
      case Jwt():
        resolver.next(true);
        break;
    }
  }
}
