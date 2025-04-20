import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/view/home/categories/viewmodel/categories_view_model.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BaseView<CategoriesViewModel>(
      viewModel: CategoriesViewModel(),
      onModelReady: (model) {
       model.setContext(context);
       model.init();
      },
      onPageBuilder: (BuildContext context,CategoriesViewModel viewModel) {
       return const Scaffold(
         body: Placeholder(),
       );
       },
     );
  }
}
