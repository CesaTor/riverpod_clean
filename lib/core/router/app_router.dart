import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/auth/auth_guard.dart';
import 'package:riverpod_clean/core/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref);

  final WidgetRef ref;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          guards: [AuthGuard(ref)],
        ),
        AutoRoute(page: LoginRoute.page),
      ];
}
