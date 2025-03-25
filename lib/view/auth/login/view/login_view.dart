import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/_product/_constants/image_constants.dart';
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
          child: buildScaffold(context, viewModel),
        );
      },
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      key: viewModel.scaffoldState,
      body: SafeArea(
        child: Column(
          children: [
            buildAnimatedContainer(context),
            buildContainerTabBar(context),
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
      child: Column(
        children: [
          const Spacer(
            flex: 6,
          ),
          eMailTextFormField(context),
          const Spacer(),
          passwordTextFormField(context, viewModel),
          buildTextForgot(),
          const Spacer(
            flex: 6,
          ),
          buildTitleLoginButton(context),
          buildWrapChange(),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Align buildTextForgot() => const Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password?",
        ),
      );

  Wrap buildWrapChange() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () {},
          child: const Text("Sign Up"),
        ),
      ],
    );
  }

  TitleElevatedButton buildTitleLoginButton(BuildContext context) {
    return TitleElevatedButton(
      onPressed: () {},
      text: "Login",
      color: context.colors.onError,
    );
  }

  Observer passwordTextFormField(
      BuildContext context, LoginViewModel viewModel) {
    return Observer(
      builder: (context) => TextFormField(
        obscureText: viewModel.isPasswordVisible,
        validator: (value) =>
            value!.isNotEmpty ? null : "Please enter password",
        decoration: InputDecoration(
            labelText: "PASSWORD",
            icon: buildIcon(context, Icons.lock),
            suffixIcon: buildSuffixIcon(viewModel)),
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

  TextFormField eMailTextFormField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "EMAIL",
        labelStyle: context.textTheme.titleSmall,
        icon: buildIcon(context, Icons.email),
      ),
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

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: context.paddingMediumHorizontal.add(
          const EdgeInsets.only(bottom: 5),
        ),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelStyle: context.textTheme.headlineSmall,
      labelColor: Colors.black,
      unselectedLabelStyle: context.textTheme.headlineSmall,
      unselectedLabelColor: context.colors.onSurface,
      indicatorColor: context.colors.onError,
      indicatorWeight: 5,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: const [
        Tab(
          text: "   Login   ",
        ),
        Tab(
          text: " Sign Up ",
        ),
      ],
    );
  }
}
