
import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'shop_view_model.g.dart';

class ShopViewModel = _ShopViewModelBase with _$ShopViewModel;

abstract class _ShopViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => this.myContext = context;
  @override
  void init() {}

}