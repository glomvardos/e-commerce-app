import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xFF00ADB5),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF222831),
    secondary: const Color(0xFF00ADB5),
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: Color(0xFFEEEEEE),
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF393E46),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF222831),
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Color(0xFFEEEEEE),
    ),
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF222831),
    selectedItemColor: Color(0xFF00ADB5),
    unselectedItemColor: Color(0xFFEEEEEE),
    elevation: 0,
  ),
);
