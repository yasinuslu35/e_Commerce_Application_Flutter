import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/default_text_form_field.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/password_text_form_fields.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:e_commerce_application/view/auth/login/widgets/login_button.dart';
import 'package:e_commerce_application/view/auth/login/widgets/login_forgot_password_text_button.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Form(
        key: viewModel.formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DefaultTextFormField(
              controller: viewModel.emailController,
              validator: (p0) => viewModel.usernameValidation(p0),
            ),
            SizedBox(
              height: context.height * 0.03,
            ),
            PasswordTextFormField(
              controller: viewModel.passwordController,
              validator: (p0) => viewModel.passwordValidation(p0),
              labelText: LocaleKeys.login_password.locale,
            ),
            const LoginForgotPasswordTextButton(),
            LoginButton(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
