import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  LoginViewModel? viewModel;

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        key: scaffoldKey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
              TitleElevatedButton(
                onPressed: () {},
                text: "Button",
              ),
            ],
          ),
        ),
      );

  Text buildText(BuildContext context) {
    return Text(
      "Hello",
      style: context.textTheme.headlineLarge?.copyWith(
          color: context.theme.primaryColor, fontWeight: FontWeight.w100),
    );
  }
}
