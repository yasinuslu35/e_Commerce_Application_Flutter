import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'text_form_field_view_model.g.dart';

class TextFormFieldViewModel = _TextFormFieldViewModelBase
    with _$TextFormFieldViewModel;

abstract class _TextFormFieldViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => this.myContext = context;

  @override
  void init() {}

  @observable
  bool isPasswordVisible = true;

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @action
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }
}
