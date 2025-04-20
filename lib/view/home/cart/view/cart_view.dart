import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/view/home/cart/viewmodel/cart_view_model.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseView<CartViewModel>(
      viewModel: CartViewModel(),
      onModelReady: (model) {
       model.setContext(context);
       model.init();
      },
      onPageBuilder: (BuildContext context,CartViewModel viewModel) {
       return const Scaffold(
         body: Placeholder(),
       );
       },
     );
  }
}
