import 'package:e_commerce_application/core/init/theme/light/light_tema_interface.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
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
        textTheme: textTheme(),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: tabBarTheme(),
        appBarTheme: appBarTheme(),
        fontFamily: ApplicationConstants.FONT_FAMILY,
      );

  AppBarTheme appBarTheme() {
    return AppBarTheme(
        color: colorSchemeLight.brown
      );
  }

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
        unselectedLabelStyle: textThemeLight.headlineMedium
            .copyWith(color: colorSchemeLight.red),
      labelPadding: paddingInsets.lowPaddingAll,
      );
  }

  TextTheme textTheme() {
    return TextTheme(
        headlineLarge: textThemeLight.headlineLarge,
        headlineMedium: textThemeLight.headlineMedium,
        headlineSmall: textThemeLight.headlineSmall,
      );
  }

  ColorScheme _appColorScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: colorSchemeLight.black,
      onPrimary: Colors.greenAccent,
      secondary: Colors.green,
      onSecondary: Colors.black38,
      error: Colors.red.shade900,
      onError: Colors.red,
      surface: Colors.blue,
      onSurface: Colors.white30,
    );
  }
}
