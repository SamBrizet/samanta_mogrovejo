import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
   const AppTheme._();   

  static final ThemeData lightTheme = ThemeData(
     useMaterial3: true,
     primaryColor: AppColors.primary,
     colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
     scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.textDark,
      displayColor: AppColors.textDark,
    ),
     appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textLight,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppColors.textDark),
  );
    
}
