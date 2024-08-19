import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme get theme {
  var bodyTextTheme = GoogleFonts.robotoTextTheme();

  return GoogleFonts.robotoMonoTextTheme().copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
}
