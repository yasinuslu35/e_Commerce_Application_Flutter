import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:e_commerce_application/core/components/icons/google_icons.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_constants/app/app_constants.dart';
import 'package:e_commerce_application/view/_product/_constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/view/_product/_constants/navigation/navigation_constants.dart';
import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:e_commerce_application/view/auth/login/model/login_auth_button_model.dart';
import 'package:e_commerce_application/view/auth/register/model/register_request_model.dart';
import 'package:e_commerce_application/view/auth/register/service/IRegisterService.dart';
import 'package:e_commerce_application/view/auth/register/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase extends BaseViewModel
    with Store, ServiceHelper {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late IRegisterService registerService;

  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? passwordConfirmController;

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
    registerService = RegisterService(
      vexanaManager.networkManager,
      scaffoldState,
    );

    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
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
      return LocaleKeys.register_validPassword.locale;
    }
  }

  String? passwordConfirmValidation(String? value) {
    if (passwordController?.text != value) {
      return LocaleKeys.register_validPasswordConfirm.locale;
    } else {
      return null;
    }
  }

  @action
  Future<void> fetchRegisterService() async {
    final response = await registerService.fetchUserControl(
      RegisterRequestModel(
        username: emailController!.text,
        password: passwordController!.text,
        passwordConfirm: passwordConfirmController!.text,
        firstName: 'test',
        lastName: 'test',
      ),
    );
    if (response?.data != null) {
      if (response?.data?.loginResponse.token?.isEmpty ?? true) return;
      if (scaffoldState.currentContext != null) {
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response!.data!.loginResponse.token!);
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

  @action
  Future<void> btnRegisterClicked() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      print("emailController = ${emailController!.text}");
      print("passwordController = ${passwordController!.text}");
      print("passwordConfirmController = ${passwordConfirmController!.text}");
      await navigation.navigateToPage(
          path: NavigationConstants.NAME_SURNAME_VIEW,
          object: RegisterRequestModel(
              username: emailController!.text,
              password: passwordController!.text,
              passwordConfirm: passwordConfirmController!.text,
              firstName: "firstName",
              lastName: "lastName"));
    }
    isLoadingChange();
  }

  Future<void> navigateToLoginPage() async {
    await navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
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
    await registerService.googleSignIn(idToken!);
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    print('çıkış başarılı');
  }
}
