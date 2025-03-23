import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';
import '../../init/network/vexana_manager.dart';
import 'package:flutter/cupertino.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext myContext;
  VexanaManager? vexanaManager = VexanaManager.instance;
  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;

  VexanaManager get vexanaManagerComputed => VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);

  void init();
}
