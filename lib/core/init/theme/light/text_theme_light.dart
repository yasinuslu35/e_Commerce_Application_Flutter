import 'package:flutter/material.dart';

class TextThemeLight {
  TextThemeLight._init();

  static TextThemeLight? _instance;

  static TextThemeLight get instance {
    _instance ??= TextThemeLight._init();
    return _instance!;
  }

  final TextStyle headlineLarge = const TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  final TextStyle headlineMedium = const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headlineSmall = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  final TextStyle overline = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
