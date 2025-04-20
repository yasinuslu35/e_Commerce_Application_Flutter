import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/icons/bottom_bar_icon.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/home/template/viewmodel/template_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TemplateView extends StatelessWidget {
  const TemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<TemplateViewModel>(
      viewModel: TemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, TemplateViewModel viewModel) {
        return Scaffold(
          body: Observer(builder: (context) => viewModel.page),
          bottomNavigationBar: Observer(
            builder: (context) => NavigationBar(
              selectedIndex: viewModel.selectedIndex,
              onDestinationSelected: (value) => viewModel.onItemTapped(value),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: [
                NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                    size: context.width * 0.06,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                    size: context.width * 0.08,
                  ),
                  label: "",
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.favorite_border,
                    size: context.width * 0.06,
                  ),
                  selectedIcon: Icon(
                    Icons.favorite,
                    size: context.width * 0.08,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    BottomBarIcon.categories,
                    size: context.width * 0.06,
                  ),
                  selectedIcon: Icon(
                    BottomBarIcon.categories_outlined,
                    size: context.width * 0.08,
                  ),
                  label: "",
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: context.width * 0.06,
                  ),
                  selectedIcon: Icon(
                    Icons.shopping_cart,
                    size: context.width * 0.08,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.person_outline,
                    size: context.width * 0.06,
                  ),
                  selectedIcon: Icon(
                    Icons.person,
                    size: context.width * 0.08,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
