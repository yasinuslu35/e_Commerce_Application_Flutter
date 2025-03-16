import 'package:e_commerce_application/core/components/card/not_found_navigation_widget.dart';
import 'package:e_commerce_application/core/constants/navigation/navigation_constants.dart';
import 'package:e_commerce_application/view/auth/test/view/test_view.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestsView());

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
