import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData themeDataBrigness = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      elevation: 8,
      primary: Colors.white,
      shape: const CircleBorder(),
      minimumSize: const Size.square(80),
    )),
  );
}
