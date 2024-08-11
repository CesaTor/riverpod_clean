import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/router/app_router.dart';
import 'package:riverpod_clean/core/ui/text.dart';
import 'package:riverpod_clean/core/ui/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: AppRouter().config(),
        theme: AppTheme(AppText.theme).theme(Brightness.light),
        darkTheme: AppTheme(AppText.theme).theme(Brightness.dark),
        themeMode: ThemeMode.system,
      ),
    ),
  );
}
