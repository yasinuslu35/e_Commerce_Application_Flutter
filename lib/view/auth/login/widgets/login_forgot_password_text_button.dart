import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginForgotPasswordTextButton extends StatelessWidget {
  const LoginForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        LocaleKeys.login_forgotText.locale,
        textAlign: TextAlign.start,
      ),
    );
  }
}
