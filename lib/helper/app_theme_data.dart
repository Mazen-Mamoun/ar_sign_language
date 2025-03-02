import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData(
    fontFamily: 'Poppins',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
