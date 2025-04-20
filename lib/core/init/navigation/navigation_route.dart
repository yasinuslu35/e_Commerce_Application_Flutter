import 'package:e_commerce_application/view/auth/login/view/login_view.dart';
import 'package:e_commerce_application/view/auth/onboard/view/on_board_view.dart';
import 'package:e_commerce_application/view/auth/register/model/register_request_model.dart';
import 'package:e_commerce_application/view/auth/register/view/name_surname_view.dart';
import 'package:e_commerce_application/view/auth/register/view/register_view.dart';
import 'package:e_commerce_application/view/auth/splash/view/splash_view.dart';
import 'package:e_commerce_application/view/home/template/view/template_view.dart';
import 'package:flutter/material.dart';

import '../../../view/_product/_constants/navigation/navigation_constants.dart';
import '../../../view/auth/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.ON_BOARD:
        return normalNavigate(const OnBoardView());
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestsView());
      case NavigationConstants.TEMPLATE_VIEW:
        return normalNavigate(const TemplateView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(const RegisterView());
      case NavigationConstants.NAME_SURNAME_VIEW:
        final registerRequestModel = args.arguments as RegisterRequestModel;
        return normalNavigate(
          NameSurnameView(
            registerRequestModel: registerRequestModel,
          ),
        );
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
