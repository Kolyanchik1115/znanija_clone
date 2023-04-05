import 'package:flutter/material.dart';

abstract class AppInputBorder {
  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Color(0xFFDEE3F2),
      width: 1,
    ),
  );
}

enum AppTheme {
  darkTheme,
  lightTheme,
}

final appThemeData = {
  AppTheme.lightTheme: ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEEF1F8),
    primarySwatch: Colors.cyan,
    fontFamily: "Intel",
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      errorStyle: TextStyle(height: 0),
      border: AppInputBorder.defaultInputBorder,
      enabledBorder: AppInputBorder.defaultInputBorder,
      focusedBorder: AppInputBorder.defaultInputBorder,
      errorBorder: AppInputBorder.defaultInputBorder,
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 6, 73, 231),
    primarySwatch: Colors.orange,
    fontFamily: "Intel",
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      errorStyle: TextStyle(height: 0),
      border: AppInputBorder.defaultInputBorder,
      enabledBorder: AppInputBorder.defaultInputBorder,
      focusedBorder: AppInputBorder.defaultInputBorder,
      errorBorder: AppInputBorder.defaultInputBorder,
    ),
  ),
};
