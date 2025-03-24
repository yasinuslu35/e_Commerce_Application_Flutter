import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

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
          child: buildScaffold(context),
        );
      },
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: buildColumnUpSide(context),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                children: [
                  const TextField(),
                  const TextField(),
                  const Text("Forgot Password?"),
                  TitleElevatedButton(
                    onPressed: () {},
                    text: "Login",
                    color: context.colors.onError,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {},
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumnUpSide(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: const Center(
              child: FlutterLogo(),
            ),
          ),
        ),
        buildContainerTabBar(context),
      ],
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
      indicatorColor: Colors.yellow,
      indicatorWeight: 5,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        const Tab(
          text: "   Login   ",
        ),
        const Tab(
          text: " Sign Up ",
        ),
      ],
    );
  }
}
