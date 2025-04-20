import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'wish_list_view_model.g.dart';

class WishListViewModel = _WishListViewModelBase with _$WishListViewModel;

abstract class _WishListViewModelBase extends BaseViewModel with Store {

  @override
  void setContext(BuildContext context) => myContext = context;
  @override
  void init() {}
}