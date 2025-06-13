import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFFC0CB);
  static const Color accentColor = Color(0xFFF48FB1);
  static const Color textColor = Color(0xFF333333);
  static const Color backgroundColor = Color(0xFFFFF0F5);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    textTheme: GoogleFonts.poppinsTextTheme(),
    useMaterial3: true,
  );
}
