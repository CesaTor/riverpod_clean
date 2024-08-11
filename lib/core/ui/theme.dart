import "package:flutter/material.dart";
import "package:riverpod_clean/core/ui/colors.dart";

class AppTheme {
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  ThemeData theme(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      textTheme: textTheme.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
    );
  }
}
