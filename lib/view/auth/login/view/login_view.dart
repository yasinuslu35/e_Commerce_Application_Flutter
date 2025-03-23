import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          buildScaffold(
              context: context, viewModel: viewModel, scaffoldKey: scaffoldKey),
    );
  }

  Scaffold buildScaffold({
    required BuildContext context,
    required LoginViewModel viewModel,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) =>
      Scaffold(
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
