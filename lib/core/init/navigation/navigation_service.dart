import 'package:e_commerce_application/core/init/navigation/I_navigation_service.dart';
import 'package:flutter/cupertino.dart';

// Normal şartlarda her class'ın bir interface'i olması gerekiyor
// interface dart dilinde tanımlı değil abstract classlara sadece method ismi yazıp
// classlara implement ettirmemiz lazım.
class NavigationService implements INavigationService {
  static NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigateToPage(
      {required String path, required Object object}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: object);
  }

  @override
  Future<void> navigateToPageClear(
      {required String path, required Object object}) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: object);
  }
}
