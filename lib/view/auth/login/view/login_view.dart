import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/_product/_constants/image_constants.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:e_commerce_application/view/auth/login/widgets/login_body.dart';
import 'package:e_commerce_application/view/auth/login/widgets/login_footer.dart';
import 'package:e_commerce_application/view/auth/login/widgets/login_header.dart';
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
                      const LoginHeader(),
                      LoginBody(viewModel: viewModel),
                      LoginFooter(viewModel: viewModel),
                    ],
                  ),
                ),
              ),
            ),
            Observer(
              builder: (context) => viewModel.isLoading
                  ? Container(
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
}