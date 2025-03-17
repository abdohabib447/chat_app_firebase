import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color(0xff1C1B1B),
    appBarTheme: const AppBarTheme(
      color: Color(0xff1F1F1F),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff007EF4),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}