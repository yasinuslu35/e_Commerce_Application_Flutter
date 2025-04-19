import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/default_text_form_field.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/password_text_form_fields.dart';
import 'package:e_commerce_application/view/auth/register/viewmodel/register_view_model.dart';
import 'package:e_commerce_application/view/auth/register/widgets/register_button.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  final RegisterViewModel viewModel;

  const RegisterBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Form(
        key: viewModel.formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DefaultTextFormField(
              controller: viewModel.emailController,
              validator: (p0) => viewModel.usernameValidation(p0),
            ),
            SizedBox(height: context.height * 0.03),
            PasswordTextFormField(
              controller: viewModel.passwordController,
              validator: (p0) => viewModel.passwordValidation(p0),
              labelText: LocaleKeys.register_password.locale,
            ),
            SizedBox(height: context.height * 0.03),
            PasswordTextFormField(
              controller: viewModel.passwordConfirmController,
              validator: (p0) => viewModel.passwordConfirmValidation(p0),
              labelText: LocaleKeys.register_confirmPassword.locale,
            ),
            SizedBox(height: context.height * 0.03),
            Text(LocaleKeys.register_offerText.locale),
            SizedBox(height: context.height * 0.03),
            RegisterButton(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
