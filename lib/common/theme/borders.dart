import 'package:flutter/material.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

abstract class AppInputBorder {
  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Color(0xFFDEE3F2),
      width: 1,
    ),
  );
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
    scaffoldBackgroundColor: Colors.deepPurple,
    primarySwatch: Colors.yellow,
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
};

const themeToString = {
  AppTheme.darkTheme: 'dark',
  AppTheme.lightTheme: 'light',
};

const stringToTheme = {
  'dark': AppTheme.darkTheme,
  'light': AppTheme.lightTheme,
};
