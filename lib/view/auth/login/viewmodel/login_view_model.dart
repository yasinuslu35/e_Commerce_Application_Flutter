import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/view/auth/login/model/login_model.dart';
import 'package:e_commerce_application/view/auth/login/service/ILoginService.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel with Store {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {
    //loginService = LoginService(VexanaManager.instance.networkManager);
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(
        LoginModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      if (response != null) {
        if (response.token?.isEmpty ?? true) return;
        if (scaffoldState.currentContext != null) {
          ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(
            SnackBar(
              content: Text(response.token!),
            ),
          );
        }
        await localeManager.setStringValue(
          PreferencesKeys.TOKEN,
          response.token!,
        );
      }
    }
    isLoadingChange();
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
