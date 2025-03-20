import 'package:e_commerce_application/core/init/cache/locale_manager.dart';
import 'package:e_commerce_application/core/init/navigation/navigation_service.dart';
import 'package:e_commerce_application/core/init/network/ICoreDio.dart';
import 'package:e_commerce_application/core/init/network/network_manager.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  late BuildContext myContext;
  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();

}