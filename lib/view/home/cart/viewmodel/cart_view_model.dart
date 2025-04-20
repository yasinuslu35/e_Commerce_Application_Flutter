import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'cart_view_model.g.dart';

class CartViewModel = _CartViewModelBase with _$CartViewModel;

abstract class _CartViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => myContext = context;
  @override
  void init() {}
}