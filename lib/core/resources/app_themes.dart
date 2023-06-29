import 'package:flutter/material.dart';
import 'package:znanija_clone/core/enums/theme_type.dart';

class AppInputBorder {
  static OutlineInputBorder get defaultInputBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(
          color: Color(0xFFDEE3F2),
          width: 1,
        ),
      );
}

class AppThemeData {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.cyan,
        fontFamily: "Intel",
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: const TextStyle(height: 0),
          border: AppInputBorder.defaultInputBorder,
          enabledBorder: AppInputBorder.defaultInputBorder,
          focusedBorder: AppInputBorder.defaultInputBorder,
          errorBorder: AppInputBorder.defaultInputBorder,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple,
        primarySwatch: Colors.yellow,
        fontFamily: "Intel",
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: const TextStyle(height: 0),
          border: AppInputBorder.defaultInputBorder,
          enabledBorder: AppInputBorder.defaultInputBorder,
          focusedBorder: AppInputBorder.defaultInputBorder,
          errorBorder: AppInputBorder.defaultInputBorder,
        ),
      );
}

class AppThemes {
  static const themeToString = {
    AppTheme.darkTheme: 'dark',
    AppTheme.lightTheme: 'light',
  };
  static const stringToTheme = {
    'dark': AppTheme.darkTheme,
    'light': AppTheme.lightTheme,
  };
}

class AuthFields {
  static const emailTextFieldDecorator = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.purple, width: 1.5),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    hintText: 'Email',
  );
  static const passTextFieldDecorator = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.purple, width: 1.5),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    hintText: 'Password',
  );
}
