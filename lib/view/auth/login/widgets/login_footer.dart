import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:e_commerce_application/view/auth/login/widgets/login_auth_buttons.dart';
import 'package:e_commerce_application/view/auth/login/widgets/login_footer_text.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginFooter({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Center(
        child: Column(
          children: [
            Text(LocaleKeys.login_footer_orText.locale),
            SizedBox(
              height: context.width * 0.04,
            ),
            LoginAuthButtons(viewModel: viewModel),
            SizedBox(
              height: context.width * 0.04,
            ),
            LoginFooterText(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
