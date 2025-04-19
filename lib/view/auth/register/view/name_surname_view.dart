import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/default_text_form_field.dart';
import 'package:e_commerce_application/view/auth/register/viewmodel/name_surname_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../model/register_request_model.dart';

class NameSurnameView extends StatelessWidget {
  final RegisterRequestModel? registerRequestModel;
  const NameSurnameView({super.key, this.registerRequestModel});

  @override
  Widget build(BuildContext context) {
    return BaseView<NameSurnameViewModel>(
      viewModel: NameSurnameViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.setRegisterArguments(registerRequestModel);
        model.init();

      },
      onPageBuilder: (BuildContext context, NameSurnameViewModel viewModel) {
        return Scaffold(
          key: viewModel.scaffoldState,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: context.paddingNormal,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(),
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
                    child: Form(
                      key: viewModel.formState,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultTextFormField(
                            controller: viewModel.nameController,
                            validator: (p0) => viewModel.formValidation(p0),
                            value: 0.44,
                            labelText: LocaleKeys.register_name,
                          ),
                          DefaultTextFormField(
                            controller: viewModel.surnameController,
                            validator: (p0) => viewModel.formValidation(p0),
                            value: 0.44,
                            labelText: LocaleKeys.register_surname,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Observer(
                      builder: (context) => TitleElevatedButton(
                        onPressed: viewModel.isLoading
                            ? null
                            : () async {
                                await viewModel.fetchRegisterService(context);
                              },
                        text: LocaleKeys.register_registerButton.locale,
                        color: context.myColors.authButtonColor,
                      ),
                    ),
                  ),
                  const Spacer(
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
