import 'package:flutter/material.dart';

class TextThemeLight {
  TextThemeLight._init();

  static TextThemeLight? _instance;

  static TextThemeLight get instance {
    _instance ??= TextThemeLight._init();
    return _instance!;
  }

  final TextStyle displayLarge = const TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.5,
    color: Colors.black,
  );
  final TextStyle displayMedium = const TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.bold,
   color: Colors.black,

  );
  final TextStyle displaySmall = const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final TextStyle headlineLarge = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.5,
    color: Colors.black,
  );
  final TextStyle headlineMedium = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final TextStyle headlineSmall = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final TextStyle titleLarge = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final TextStyle titleMedium = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  final TextStyle titleSmall = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  final TextStyle bodyMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  final TextStyle bodySmall = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  final TextStyle labelLarge = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  final TextStyle labelMedium = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  final TextStyle labelSmall = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );

}
