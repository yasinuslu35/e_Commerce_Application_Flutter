import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Container(
              padding: context.paddingLow,
              height: context.height * 0.4,
              color: context.theme.buttonTheme.colorScheme?.onPrimary,
              child: buildText(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.lowValue),
              child: Placeholder(),
            ),

          ],
        ),
      );

  Text buildText(BuildContext context) {
    return Text(
      "Hello",
      style: context.textTheme.headlineLarge?.copyWith(
        color: context.theme.primaryColor,
        fontWeight: FontWeight.w100
      ),
    );
  }
}
