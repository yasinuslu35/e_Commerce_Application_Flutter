import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_constants/image_constants.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/default_text_form_field.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/password_text_form_fields.dart';
import 'package:e_commerce_application/view/_product/_widgets/button/auth_button.dart';
import 'package:e_commerce_application/view/auth/login/model/login_auth_button_model.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onDispose: (viewModel) {
        viewModel.dispose();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) {
        return Stack(
          children: [
            Scaffold(
              key: viewModel.scaffoldState,
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: context.paddingNormal,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildHeader(context),
                      buildBody(context, viewModel),
                      buildFooter(context, viewModel),
                    ],
                  ),
                ),
              ),
            ),
            Observer(
              builder: (context) => viewModel.isLoading
                  ?  Container(
                color: Colors.black.withValues(alpha: 0.5),
                    child: Center(
                      child: Lottie.asset(
                        ImageConstants.instance.loadingAnimaton,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  )
                  : const SizedBox(),
            ),
          ],
        );
      },
    );
  }

  Expanded buildHeader(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Text(
          LocaleKeys.login_welcomeText.locale,
          style: context.textTheme.headlineMedium,
        ),
      ),
    );
  }

  Expanded buildBody(BuildContext context, LoginViewModel viewModel) {
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
            buildForgotTextButton(),
            buildLoginButton(context, viewModel),
            /*
            Observer(
              builder: (context) =>  viewModel.isLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox(),
            ),

             */
          ],
        ),
      ),
    );
  }

  TextButton buildForgotTextButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        LocaleKeys.login_forgotText.locale,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
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

  Expanded buildFooter(BuildContext context, viewModel) {
    return Expanded(
      flex: 4,
      child: Center(
        child: Column(
          children: [
            Text(LocaleKeys.login_footer_orText.locale),
            SizedBox(
              height: context.width * 0.04,
            ),
            buildAuthButtons(context, viewModel),
            SizedBox(
              height: context.width * 0.04,
            ),
            buildFooterText(viewModel),
          ],
        ),
      ),
    );
  }

  Row buildFooterText(LoginViewModel viewModel) {
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

  SizedBox buildAuthButtons(BuildContext context, viewModel) {
    return SizedBox(
      width: context.width * 0.7,
      height: context.width * 0.17,
      child: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              width: context.width * 0.05,
            );
          },
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            LoginAuthButtonModel model = viewModel.loginAuthButtonModels[index];
            return AuthButton(
              icon: model.icon,
              color: model.color,
              heroTag: "buttonLogin$index",
              onPressed: model.onPressed,
            );
          },
        ),
      ),
    );
  }
}
