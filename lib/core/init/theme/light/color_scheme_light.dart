import 'package:flutter/material.dart';

class ColorSchemeLight {
  ColorSchemeLight._init();

  static ColorSchemeLight? _instance;

  static ColorSchemeLight get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance!;
  }

  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xffc10e0e);
  final Color white = const Color(0xffffffff);
  final Color gray = const Color(0xffa5a6ae);
  final Color lightGray = const Color(0xfff7f7f7);
  final Color darkGray = const Color(0xff676870);
  final Color black = const Color(0xff020306);
  final Color blue = const Color(0xFF0A84FF);
  final Color green = const Color(0xFF32D74B);
  final Color scaffoldColor = Colors.white;
  final Color orange = const Color(0xffffc93c);
  final Color lightRed = const Color(0xfff9506d);
  final Color lavenderBlush = const Color(0xffFCF3F6);
  final Color authButtonColor = const Color(0xffF83758);
  final Color textFieldBackground = const Color(0xFFF3F3F3);
  final Color azure = const Color(0xff27928d);
}
