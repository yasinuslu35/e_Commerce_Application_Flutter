import 'package:e_commerce_application/core/constants/app/app_constants.dart';
import 'package:e_commerce_application/core/init/lang/language_service.dart';
import 'package:e_commerce_application/core/init/navigation/navigation_route.dart';
import 'package:e_commerce_application/core/init/navigation/navigation_service.dart';
import 'package:e_commerce_application/core/init/notifier/provider_list.dart';
import 'package:e_commerce_application/core/init/notifier/theme_notifier.dart';
import 'package:e_commerce_application/view/auth/onboard/view/on_board_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        supportedLocales: LanguageService.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
        startLocale: LanguageService.instance.enLocale,
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: const OnBoardView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      locale: context.locale,
    );
  }
}
