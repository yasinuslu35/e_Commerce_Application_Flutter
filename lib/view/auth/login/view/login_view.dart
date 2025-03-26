import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/components/text/locale_text.dart';
import 'package:e_commerce_application/core/components/textFormField/base_text_form_field.dart';
import 'package:e_commerce_application/core/components/textFormField/password_text_form_field.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/view/_product/_constants/image_constants.dart';
import 'package:e_commerce_application/view/_product/_widgets/loginTabBar/login_tabbar_business.dart';
import 'package:e_commerce_application/view/auth/login/model/login_model.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) {
        return DefaultTabController(
          length: 2,
          child: buildScaffold(
              context, viewModel, viewModel.loginModelItems.first),
        );
      },
    );
  }

  Scaffold buildScaffold(
      BuildContext context, LoginViewModel viewModel, LoginModel model) {
    return Scaffold(
      key: viewModel.scaffoldState,
      body: SafeArea(
        child: Column(
          children: [
            buildAnimatedContainer(context),
            LoginTabbarBusiness(
              tabs: [
                Tab(
                  text: "   ${model.tab1.locale}   ",
                ),
                Tab(
                  text: " ${model.tab2.locale} ",
                ),
              ],
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: context.paddingLow,
                child: buildForm(viewModel, context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height:
          context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: Colors.white,
      child: Center(
        child: Image.asset(ImageConstants.instance.hotDog),
      ),
    );
  }

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          const Spacer(
            flex: 6,
          ),
          eMailTextFormField(
              context, viewModel, viewModel.loginModelItems.first),
          const Spacer(),
          passwordTextFormField(
              context, viewModel, viewModel.loginModelItems.first),
          buildTextForgot(viewModel.loginModelItems.first),
          const Spacer(
            flex: 6,
          ),
          buildTitleLoginButton(
              context, viewModel, viewModel.loginModelItems.first),
          buildWrapChange(viewModel.loginModelItems.first),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Align buildTextForgot(LoginModel model) => Align(
        alignment: Alignment.centerRight,
        child: LocaleText(
          value: model.forgotText,
        ),
      );

  Wrap buildWrapChange(LoginModel model) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        LocaleText(
          value: model.dontAccount,
        ),
        TextButton(
          onPressed: () {},
          child: LocaleText(
            value: model.tab2,
          ),
        ),
      ],
    );
  }

  Widget buildTitleLoginButton(
      BuildContext context, LoginViewModel viewModel, LoginModel model) {
    return Observer(
      builder: (context) => TitleElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        text: model.loginButtonText.locale,
        color: context.colors.onError,
      ),
    );
  }

  Observer passwordTextFormField(
      BuildContext context, LoginViewModel viewModel, LoginModel model) {
    return Observer(
      builder: (context) => PasswordTextFormField(
        controller: viewModel.passwordController,
        obscureText: viewModel.isPasswordVisible,
        validator: (value) =>
            value!.isNotEmpty ? null : model.validPassword?.locale,
        suffixIcon: buildSuffixIcon(viewModel),
      ),
    );
  }

  Widget buildSuffixIcon(LoginViewModel viewModel) => InkWell(
        onTap: () {
          viewModel.changePasswordVisibility();
        },
        child: Observer(
          builder: (context) => Icon(
            viewModel.isPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility,
          ),
        ),
      );

  Widget eMailTextFormField(
      BuildContext context, LoginViewModel viewModel, LoginModel model) {
    return BaseTextFormField(
      labelText: model.email.locale,
      icon: Icons.email,
      controller: viewModel.emailController,
      validator: (value) =>
          value!.isNotEmpty ? null : model.validUsername?.locale,
    );
  }

  Padding buildIcon(BuildContext context, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.height * 0.03,
      ),
      child: Icon(
        icon,
        size: context.width * 0.07,
        color: context.colors.onError,
      ),
    );
  }
}
