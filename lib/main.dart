import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pre_build_config.dart';
part 'pre_run_config.dart';

void main() async {
  await _preRunConfig(
    () async {
      runApp(await _preBuildConfig(_app));
    },
  );
}

Widget _app(WidgetRef ref) => MaterialApp.router(
      routerConfig: AppRouter(ref).config(),
      theme: AppTheme(theme).theme(Brightness.light),
      darkTheme: AppTheme(theme).theme(Brightness.dark),
      themeMode: ThemeMode.system,
    );
