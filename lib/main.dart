import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/router/app_router.dart';
import 'package:riverpod_clean/core/storage/storage_provider.dart';
import 'package:riverpod_clean/core/ui/text.dart';
import 'package:riverpod_clean/core/ui/theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  _preRunConfig(
    () async => runApp(
      await _preBuildConfig(_app),
    ),
  );
}

Future<void> _preRunConfig(Future<void> Function() runApp) async {
  // Init Sentry
  const dns = String.fromEnvironment('SENTRY_DNS', defaultValue: '');
  await SentryFlutter.init(
    (options) {
      options.dsn = dns;
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: runApp,
  );

  FlutterError.onError = (details) {
    if (!kDebugMode) {
      Sentry.captureException(details.exception, stackTrace: details.stack);
    }
  };
}

Future<Widget> _preBuildConfig(
  Widget Function(WidgetRef ref) app,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  return ProviderScope(
    overrides: [
      // Init SharedPreferences
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      )
    ],
    child: Consumer(builder: (_, ref, __) => app(ref)),
  );
}

Widget _app(WidgetRef ref) {
  return MaterialApp.router(
    routerConfig: AppRouter(ref).config(),
    theme: AppTheme(AppText.theme).theme(Brightness.light),
    darkTheme: AppTheme(AppText.theme).theme(Brightness.dark),
    themeMode: ThemeMode.system,
  );
}
