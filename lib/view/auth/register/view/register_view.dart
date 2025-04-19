import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/view/auth/register/widgets/register_body.dart';
import 'package:e_commerce_application/view/auth/register/widgets/register_footer.dart';
import 'package:e_commerce_application/view/auth/register/widgets/register_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:e_commerce_application/view/_product/_constants/image_constants.dart';
import 'package:e_commerce_application/view/auth/register/viewmodel/register_view_model.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:lottie/lottie.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onDispose: (viewModel) {
        viewModel.dispose();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel viewModel) {
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
                      const RegisterHeader(),
                      RegisterBody(viewModel: viewModel),
                      RegisterFooter(viewModel: viewModel),
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
