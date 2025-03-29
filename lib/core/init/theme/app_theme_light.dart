import 'package:e_commerce_application/core/init/theme/light/light_tema_interface.dart';
import 'package:flutter/services.dart';

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
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        inputDecorationTheme: inputDecorationTheme(),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: colorSchemeLight.green,
                ),
        scaffoldBackgroundColor: colorSchemeLight.scaffoldColorLoginPage,
        tabBarTheme: tabBarTheme,
        appBarTheme: appBarTheme(),
        cardTheme: ThemeData.light().cardTheme.copyWith(
          color: Colors.white,

        ),
        fontFamily: ApplicationConstants.FONT_FAMILY,
      );

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      focusColor: Colors.black12,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight.red,
        ),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight.red,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: colorSchemeLight.blue,
        ),
      ),
    );
  }

  AppBarTheme appBarTheme() {
    return ThemeData.light().appBarTheme.copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: const IconThemeData(
            color: Colors.black87,
            size: 20,
          ),
        );
  }

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      // unselectedLabelStyle:
      //     textThemeLight.headlineExtraSmall.copyWith(color: colorSchemeLight.red),
      labelPadding: paddingInsets.lowPaddingAll,
      dividerColor: Colors.transparent,
      labelStyle: textThemeLight.headlineSmall,
      labelColor: _appColorScheme.onSecondary,
      unselectedLabelColor: _appColorScheme.onSecondary.withValues(alpha: 0.2),
      indicatorColor: colorSchemeLight.blue,
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(

          headlineLarge: textThemeLight.headlineLarge,
          headlineMedium: textThemeLight.headlineMedium.copyWith(
            color: Colors.black,
          ),
          headlineSmall: textThemeLight.headlineSmall.copyWith(
            color: Colors.black,
          ),
        );
  }

  ColorScheme get _appColorScheme => ColorScheme(
        primary: colorSchemeLight.blue,
        // Mavi ton - Ana renk
        onPrimary: Colors.white,
        // Primary üzerinde yazı/ikonlar
        secondary: colorSchemeLight.green,
        // Yeşil - Vurgu rengi
        onSecondary: Colors.black,
        error: colorSchemeLight.red,
        // Kırmızı - Hata
        onError: colorSchemeLight.orange,
        //xx
        surface: Colors.blue,
        //xx
        // Kart/dialog arka plan
        onSurface: Colors.black26,
        brightness: Brightness.light,
      );
}
