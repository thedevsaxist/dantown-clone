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
    ),
  );
}

class AppColors {
  static final primaryColor = Color(0xFF00026e);
  static final secondaryColor = Color(0xFF99a0b0);
  static final backgroundColor = Color(0xFFfafafa);
  static final secondaryBackgroundColor = Color(0xFFf5f9ff);
  static final darkGrey = Color(0xFF3d3d3d);
  static final lightBlue = Color(0xFFf5f7ff);
  static final lightBlue200 = Color(0xFFf2f5fc);
}
