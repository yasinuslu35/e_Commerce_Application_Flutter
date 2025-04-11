import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/view/auth/splash/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
       model.setContext(context);
       model.init();
      },
      onPageBuilder: (BuildContext context,SplashViewModel viewModel) {
       return Scaffold();
       },
     );
  }
}
