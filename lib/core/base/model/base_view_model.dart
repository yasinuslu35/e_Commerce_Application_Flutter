import 'package:flutter/cupertino.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  late BuildContext myContext;
  VexanaManager vexanaManager = VexanaManager();

  //ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;

  //VexanaManager get vexanaManagerComputed => VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);

  void init();
}
