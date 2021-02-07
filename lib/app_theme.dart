import 'package:desk_focus/utils/color-creator.dart';
import 'package:flutter/material.dart';

final primarySwatch = createMaterialColor(
  Color(0xFFEDF2F4),
);
final primarySwatchDark = createMaterialColor(
  Color(0xFF2B2D42),
);
final accentColor = Color(0xFFF34213);

class AppTheme {
  bool darkMode;

  AppTheme({this.darkMode = false});

  ThemeData get themeData {
    return darkMode ? _darkTheme : _lightTheme;
  }

  ThemeData get _darkTheme {
    TextTheme textTheme = ThemeData.dark().textTheme;

    var colorScheme = ColorScheme.fromSwatch(
      primarySwatch: primarySwatchDark,
      primaryColorDark: primarySwatchDark.shade700,
      accentColor: accentColor,
      cardColor: primarySwatchDark,
      backgroundColor: primarySwatchDark.shade700,
      errorColor: Colors.red.shade400,
      brightness: Brightness.dark,
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(
        toggleableActiveColor: accentColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primarySwatchDark,
          selectedItemColor: accentColor,
          unselectedItemColor: primarySwatchDark.shade700,
        ));
  }

  ThemeData get _lightTheme {
    TextTheme textTheme = ThemeData.light().textTheme;

    var colorScheme = ColorScheme.fromSwatch(
      primarySwatch: primarySwatch,
      primaryColorDark: primarySwatch.shade700,
      accentColor: accentColor,
      cardColor: primarySwatch,
      backgroundColor: primarySwatch.shade700,
      errorColor: Colors.red.shade400,
      brightness: Brightness.light,
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: textTheme,
    ).copyWith(
      toggleableActiveColor: accentColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primarySwatch,
        selectedItemColor: accentColor,
        unselectedItemColor: primarySwatch.shade700,
      ),
    );
  }

  static const Color colorPrimaryBackground = Color(0xff242423);
  static const Color colorPrimary = Color(0xff333533);
  static const Color colorAccent = Color(0xff6883BA);
}

class LightAppTheme {
  static const Color colorPrimaryBackground = Color(0xffCFDBD5);
  static const Color colorPrimary = Color(0xffE8EDDF);
}
