import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store {

  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {}

  bool isLoading = false;

  @observable
  bool isPasswordVisible = false;

  @action
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void fetchLoginService(args) {

  }
}
