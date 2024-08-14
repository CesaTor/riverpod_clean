import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/router/app_router.dart';
import 'package:riverpod_clean/core/storage/storage_provider.dart';
import 'package:riverpod_clean/core/ui/text.dart';
import 'package:riverpod_clean/core/ui/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: Consumer(
        builder: (context, ref, child) => MaterialApp.router(
          routerConfig: AppRouter(ref).config(),
          theme: AppTheme(AppText.theme).theme(Brightness.light),
          darkTheme: AppTheme(AppText.theme).theme(Brightness.dark),
          themeMode: ThemeMode.system,
        ),
      ),
    ),
  );
}
