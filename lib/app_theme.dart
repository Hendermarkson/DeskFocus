import 'package:flutter/material.dart';

class AppTheme {
  bool darkMode;

  AppTheme({this.darkMode = false});

  ThemeData get themeData {
    return darkMode ? _darkTheme : _lightTheme;
  }

  ThemeData get _darkTheme {
    TextTheme textTheme = ThemeData.dark().textTheme;
    // Should be brightness dark;
    // TODO: Currently an open issue: https://github.com/flutter/flutter/issues/48195
    ColorScheme colorScheme = ColorScheme.dark(
      brightness: Brightness.light,
      primary: Color(0xFF2B2D42),
      primaryVariant: Color(0xFF202231),
      secondary: Color(0xFFF34213),
      secondaryVariant: Color(0xFFB9300A),
      background: Color(0xFF202231),
      surface: Color(0xFF2B2D42),
      onBackground: Color(0xFFEDF2F4),
      onSurface: Color(0xFFEDF2F4),
      onError: Colors.white,
      onPrimary: Color(0xFFEDF2F4),
      onSecondary: Color(0xFFEDF2F4),
      error: Colors.red.shade400,
    );

    return ThemeData.from(textTheme: textTheme, colorScheme: colorScheme);
  }

  ThemeData get _lightTheme {
    TextTheme textTheme = ThemeData.light().textTheme;
    ColorScheme colorScheme = ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xFFEDF2F4),
      primaryVariant: Color(0xFFD9E4E8),
      secondary: Color(0xFFF34213),
      secondaryVariant: Color(0xFFB9300A),
      background: Color(0xFFD9E4E8),
      surface: Color(0xFFEDF2F4),
      onBackground: Color(0xFF2B2D42),
      onSurface: Color(0xFF2B2D42),
      onError: Colors.white,
      onPrimary: Color(0xFF2B2D42),
      onSecondary: Color(0xFFEDF2F4),
      error: Colors.red.shade400,
    );

    return ThemeData.from(textTheme: textTheme, colorScheme: colorScheme);
  }

  static const Color colorPrimaryBackground = Color(0xff242423);
  static const Color colorPrimary = Color(0xff333533);
  static const Color colorAccent = Color(0xff6883BA);
}

class LightAppTheme {
  static const Color colorPrimaryBackground = Color(0xffCFDBD5);
  static const Color colorPrimary = Color(0xffE8EDDF);
}
