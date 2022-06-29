import 'package:flutter/material.dart';

final theme = ThemeData(
  primaryColor: Colors.black,
  primaryColorDark: const Color(0xff000000),
  primaryColorLight: const Color(0xffdb0000),
  appBarTheme: const AppBarTheme(
    color: Color(0xff000000),
  ),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    accentColor: const Color(0xffdb0000),
  ),
    snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
  ),
  toggleableActiveColor: const Color(0xffffffff),
);
