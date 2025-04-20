import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/view/home/wishList/viewmodel/wish_list_view_model.dart';
import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseView<WishListViewModel>(
      viewModel: WishListViewModel(),
      onModelReady: (model) {
       model.setContext(context);
       model.init();
      },
      onPageBuilder: (BuildContext context,WishListViewModel viewModel) {
       return const Scaffold(
         body: Placeholder(),
       );
       },
     );
  }
}
