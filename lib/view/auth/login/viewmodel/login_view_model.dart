import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/components/icons/google_icons.dart';
import 'package:e_commerce_application/core/constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/login/model/login_auth_button_model.dart';
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

  List<LoginAuthButtonModel> loginAuthButtonModels = [];

  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {
    loginAuthButtonModels.add(
      LoginAuthButtonModel(
        icon: AuthIcon.google,
        color: myContext.myColors.red,
      ),
    );
    loginAuthButtonModels.add(
      LoginAuthButtonModel(
        icon: Icons.apple,
        color: Colors.black,
      ),
    );
    loginAuthButtonModels.add(
      LoginAuthButtonModel(
        icon: AuthIcon.facebook,
        color: Colors.blue,
      ),
    );
    loginService = LoginService(
      vexanaManager.networkManager,
      scaffoldState,
    );

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  String? usernameValidation(String? value) {
    if (value!.length < 3) {
      return LocaleKeys.login_validUsername.locale;
    } else {
      return null;
    }
  }

  String? passwordValidation(String? value) {
    if (value!.isValidPassword) {
      return null;
    } else {
      return LocaleKeys.login_validPassword.locale;
    }
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
      if (response?.data != null) {
        if (response?.data?.token?.isEmpty ?? true) return;
        if (scaffoldState.currentContext != null) {
          ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(
            SnackBar(
              content: Text(response!.data!.token!),
            ),
          );
        }
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response!.data!.token!);
      }
    }
    isLoadingChange();
  }

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
  }
}
