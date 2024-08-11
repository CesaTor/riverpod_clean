import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/router/app_router.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(routerConfig: AppRouter().config()),
    ),
  );
}
