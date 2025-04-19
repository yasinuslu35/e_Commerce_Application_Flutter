import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginFooterText extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginFooterText({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.login_footer_createText.locale),
        TextButton(
          onPressed: () async {
            //await viewModel.signOut();
            await viewModel.navigateToRegisterPage();
          },
          child: Text(LocaleKeys.login_footer_signUpText.locale),
        ),
      ],
    );
  }
}
