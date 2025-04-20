import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/view/home/cart/view/cart_view.dart';
import 'package:e_commerce_application/view/home/categories/view/categories_view.dart';
import 'package:e_commerce_application/view/home/profile/view/profile_view.dart';
import 'package:e_commerce_application/view/home/shop/view/shop_view.dart';
import 'package:e_commerce_application/view/home/wishList/view/wish_list_view.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'template_view_model.g.dart';

class TemplateViewModel = _TemplateViewModelBase with _$TemplateViewModel;

abstract class _TemplateViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => myContext = context;

  @observable
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  late NavigationDestinationLabelBehavior labelBehavior;
  static final List<Widget> _pages = [
    const ShopView(),
    const WishListView(),
    const CategoriesView(),
    const CartView(),
    const ProfileView(),
  ];
  Widget get page => _pages[selectedIndex];

  @action
  void onItemTapped(int value) {
    _selectedIndex = value;
  }

  @override
  void init() {
    labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
  }
}
