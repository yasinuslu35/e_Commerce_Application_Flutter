import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'categories_view_model.g.dart';

class CategoriesViewModel = _CategoriesViewModelBase with _$CategoriesViewModel;

abstract class _CategoriesViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => this.myContext = context;
  @override
  void init() {}
}