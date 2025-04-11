import 'package:e_commerce_application/view/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';

import '../../../view/auth/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const LoginView());
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestsView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
