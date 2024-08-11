import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final routerConfig = AppRouter().config();
  runApp(
    ProviderScope(
      child: MaterialApp.router(routerConfig: routerConfig),
    ),
  );
}
