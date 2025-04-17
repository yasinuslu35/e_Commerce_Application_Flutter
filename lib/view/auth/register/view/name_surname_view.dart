import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/default_text_form_field.dart';
import 'package:e_commerce_application/view/auth/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NameSurnameView extends StatelessWidget {
  const NameSurnameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel viewModel) {
        return Scaffold(
          body: Padding(
            padding: context.paddingNormal,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        LocaleKeys.register_welcomeText.locale,
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultTextFormField(
                          controller: viewModel.emailController,
                          validator: (p0) => viewModel.usernameValidation(p0),
                          value: 0.44,
                          labelText: LocaleKeys.register_name.locale,
                        ),
                        DefaultTextFormField(
                          controller: viewModel.emailController,
                          validator: (p0) => viewModel.usernameValidation(p0),
                          value: 0.44,
                          labelText: LocaleKeys.register_surname.locale,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (context) => TitleElevatedButton(
                        onPressed: viewModel.isLoading
                            ? null
                            : () async {
                                await viewModel.btnRegisterClicked();
                              },
                        text: LocaleKeys.register_registerButton.locale,
                        color: context.myColors.authButtonColor,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
