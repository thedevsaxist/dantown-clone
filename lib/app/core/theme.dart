import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    fontFamily: GoogleFonts.rubik().fontFamily,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    iconTheme: IconThemeData(color: AppColors.primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      actionsIconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secondaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundColor,
    ),
  );
}

class AppColors {
  static final Color primaryColor = Color(0xFF00026e);
  static final Color secondaryColor = Color(0xFF99a0b0);
  static final Color backgroundColor = Color(0xFFfafafa);
  static final Color secondaryBackgroundColor = Color(0xFFf5f9ff);
  static final Color darkGrey = Color(0xFF798499);
  static final Color lightGrey = Color(0xFFf0f0f0);
  static final Color lightBlue = Color(0xFFf5f7ff);
  static final Color lightBlue200 = Color(0xFFf2f5fc);
  static final Color green = Color(0xFF54b890);
  static final Color textGreen = Color(0xFF54ab58);
  static final Color yellow = Color(0xFFffed51);
  static final Color darkBlue = Color(0xFF14127a);
  static final Color textYellow = Color(0xFF736d47);
  static final Color lightPurple = Color(0xFFefebfc);
  static final Color purple = Color(0xFF9b7cf7);
  static final Color darkPurple = Color(0xFF1a042e);
  static final Color textPurple = Color(0xFF897d93);
}
