import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF20205C); // azul escuro
  static const Color lightGrey = Color(0xFFE5E5E5); // fundo claro

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightGrey,
    primaryColor: primaryColor,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: primaryColor),
      bodyMedium: TextStyle(color: primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      labelStyle: TextStyle(color: primaryColor),
    ),
  );
}
