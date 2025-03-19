import 'package:e_commerce_application/core/constants/app/app_constants.dart';
import 'package:e_commerce_application/core/init/theme/app_theme.dart';
import 'package:e_commerce_application/core/init/theme/light_theme_interface.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  AppThemeLight._init();

  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme(),
        textTheme: TextTheme(
          headlineLarge: textThemeLight.headlineLarge,
          headlineMedium: textThemeLight.headlineMedium,
          headlineSmall: textThemeLight.headlineSmall,
        ),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: TabBarTheme(
          unselectedLabelStyle: textThemeLight.headlineMedium
              .copyWith(color: colorSchemeLight.gray),
        ),
        fontFamily: ApplicationConstants.FONT_FAMILY,
      );

  ColorScheme _appColorScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: colorSchemeLight.black,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.green.shade200,
      error: Colors.red.shade500,
      onError: Colors.red,
      surface: Colors.blue,
      onSurface: Colors.white30,
    );
  }
}
