import 'dart:convert';

import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:e_commerce_application/core/components/icons/google_icons.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/core/init/notifier/user_notifier.dart';
import 'package:e_commerce_application/view/_product/_constants/app/app_constants.dart';
import 'package:e_commerce_application/view/_product/_constants/navigation/navigation_constants.dart';
import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:e_commerce_application/view/auth/login/model/login_auth_button_model.dart';
import 'package:e_commerce_application/view/auth/login/model/login_request_model.dart';
import 'package:e_commerce_application/view/auth/login/service/ILoginService.dart';
import 'package:e_commerce_application/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../_product/_constants/enums/locale_keys_enum.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase extends BaseViewModel
    with Store, ServiceHelper {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  List<LoginAuthButtonModel> loginAuthButtonModels = [];

  static const List<String> scopes = <String>[
    'email',
  ];

  final googleSignIn = GoogleSignIn(
    scopes: scopes,
    serverClientId: ApplicationConstants.CLIENT_ID_WEB,
  );

  @override
  void setContext(BuildContext context) => myContext = context;

  @override
  void init() {
    loginAuthButtonModels.add(
      LoginAuthButtonModel(
        icon: AuthIcon.google,
        color: myContext.myColors.red,
        onPressed: googleSignInButton,
      ),
    );
    loginAuthButtonModels.add(
      LoginAuthButtonModel(
        icon: Icons.apple,
        color: Colors.black,
        onPressed: () {},
      ),
    );
    loginAuthButtonModels.add(
      LoginAuthButtonModel(
        icon: AuthIcon.facebook,
        color: Colors.blue,
        onPressed: () {},
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
    String? newValue = value?.replaceAll(" ", "");
    if (newValue!.length < 3) {
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
          username: emailController!.text,
          password: passwordController!.text,
        ),
      );
      if (response?.data != null) {
        if (response?.data?.loginResponse.token?.isEmpty ?? true) return;
        if (scaffoldState.currentContext != null) {
          await localeManager.setStringValue(
              PreferencesKeys.TOKEN, response!.data!.loginResponse.token!);
          await localeManager.setStringValue(
              PreferencesKeys.USER, jsonEncode(response.data!.toJson()));

          final double tokenExpireDate = response.data!.loginResponse.expiresIn!;

          final currentTimestamp = DateTime.now().millisecondsSinceEpoch;
          final expireTimeStamp = currentTimestamp + tokenExpireDate;


          await localeManager.setDoubleValue(PreferencesKeys.EXPIRE_DATE,
              expireTimeStamp);


          await Provider.of<UserNotifier>(myContext, listen: false).setUser();
          navigateToHomePage();
        }
      } else if (response?.error != null) {
        final errorResult = response?.error as ErrorDataResult;
        if (errorResult.data != null) {
          showMessage(errorResult, scaffoldState.currentContext);
        } else {
          showMessage(errorResult, scaffoldState.currentContext);
        }
      }
    }
    isLoadingChange();
  }

  Future<void> navigateToRegisterPage() async {
    await navigation.navigateToPageClear(
        path: NavigationConstants.REGISTER_VIEW);
  }

  Future<void> navigateToHomePage() async {
    await navigation.navigateToPageClear(
        path: NavigationConstants.TEMPLATE_VIEW);
  }

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
  }

  Future<void> googleSignInButton() async {
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    googleAuth(account);
  }

  Future<void> googleAuth(GoogleSignInAccount? account) async {
    final GoogleSignInAuthentication auth = await account!.authentication;
    final idToken = auth.idToken;
    final response = await loginService.googleSignIn(idToken!);
    await localeManager.setStringValue(
        PreferencesKeys.TOKEN, response!.data!.loginResponse.token!);
    await localeManager.setStringValue(
        PreferencesKeys.USER, response.data!.toJson().toString());

    final double tokenExpireDate = response.data!.loginResponse.expiresIn!;

    final currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    final expireTimeStamp = currentTimestamp + tokenExpireDate;


    await localeManager.setDoubleValue(PreferencesKeys.EXPIRE_DATE,
        expireTimeStamp);
    Provider.of<UserNotifier>(myContext, listen: false).setUser();
    navigateToHomePage();
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    print('çıkış başarılı');
  }
}
