import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginButton extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => TitleElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
          viewModel.fetchLoginService();
        },
        text: LocaleKeys.login_loginButton.locale,
        color: context.myColors.authButtonColor,
      ),
    );
  }
}
