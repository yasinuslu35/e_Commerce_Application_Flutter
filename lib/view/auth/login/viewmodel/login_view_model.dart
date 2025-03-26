import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/core/init/network/vexana_manager.dart';
import 'package:e_commerce_application/view/auth/login/model/login_model.dart';
import 'package:e_commerce_application/view/auth/login/model/login_request_model.dart';
import 'package:e_commerce_application/view/auth/login/service/ILoginService.dart';
import 'package:e_commerce_application/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => myContext = context;

  List<LoginModel> loginModelItems = [];

  @override
  void init() {
    loginModelItems.add(
      LoginModel(
        tab1: LocaleKeys.login_tab1,
        tab2: LocaleKeys.login_tab2,
        email: LocaleKeys.login_email,
        password: LocaleKeys.login_password,
        forgotText: LocaleKeys.login_forgotText,
        loginButtonText: LocaleKeys.login_login,
        dontAccount: LocaleKeys.login_dontAccount,
        validUsername: LocaleKeys.login_validUsername,
        validPassword: LocaleKeys.login_validPassword,
      ),
    );
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isPasswordVisible = false;

  @action
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(
        LoginRequestModel(
          username: emailController?.text,
          password: passwordController?.text,
        ),
      );
      if (response != null) {
        print("response token = ${response.token}");
        print("response expires in = ${response.expiresIn}");
        if (response.token?.isEmpty ?? true) return;
        if (scaffoldState.currentContext != null) {
          ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(
            SnackBar(
              content: Text(response.token!),
            ),
          );
        }
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.token!);
      }
    }
    isLoadingChange();
  }

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
  }
}
