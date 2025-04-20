import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/view/home/shop/viewmodel/shop_view_model.dart';
import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseView<ShopViewModel>(
      viewModel: ShopViewModel(),
      onModelReady: (model) {
       model.setContext(context);
       model.init();
      },
      onPageBuilder: (BuildContext context,ShopViewModel viewModel) {
       return const Scaffold(
         body: Placeholder(),
       );
       },
     );
  }
}
