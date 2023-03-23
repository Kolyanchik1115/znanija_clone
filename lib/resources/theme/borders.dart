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

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFEEF1F8),
    primarySwatch: Colors.blue,
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
  );
}
