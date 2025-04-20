import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/core/init/notifier/user_notifier.dart';
import 'package:e_commerce_application/view/_product/_constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/view/_product/_constants/navigation/navigation_constants.dart';
import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:e_commerce_application/view/auth/register/model/register_request_model.dart';
import 'package:e_commerce_application/view/auth/register/service/IRegisterService.dart';
import 'package:e_commerce_application/view/auth/register/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'name_surname_view_model.g.dart';

class NameSurnameViewModel = _NameSurnameViewModelBase
    with _$NameSurnameViewModel;

abstract class _NameSurnameViewModelBase extends BaseViewModel
    with Store, ServiceHelper {
  @override
  void setContext(BuildContext context) => myContext = context;

  RegisterRequestModel? _registerModelForService;
  TextEditingController? nameController;
  TextEditingController? surnameController;
  String? _username;
  String? _password;
  String? _passwordConfirm;
  late IRegisterService registerService;
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  void init() {
    nameController = TextEditingController();
    surnameController = TextEditingController();
    registerService =
        RegisterService(vexanaManager.networkManager, scaffoldState);
  }

  @observable
  bool isLoading = false;

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  void setRegisterArguments(Object? args) {
    if (args != null && args is RegisterRequestModel) {
      _registerModelForService = args;
      _username = _registerModelForService!.username;
      _password = _registerModelForService!.password;
      _passwordConfirm = _registerModelForService!.passwordConfirm;
    }
  }

  String? formValidation(String? value) {
    String? newValue = value?.replaceAll(" ", "");
    if (newValue!.length < 3) {
      return LocaleKeys.login_validUsername.locale;
    } else {
      return null;
    }
  }

  @action
  Future<void> fetchRegisterService(BuildContext context) async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await registerService.fetchUserControl(
        RegisterRequestModel(
          username: _username.toString(),
          password: _password.toString(),
          passwordConfirm: _passwordConfirm.toString(),
          firstName: nameController!.text,
          lastName: surnameController!.text,
        ),
      );
      if (response?.data != null) {
        if (response?.data?.loginResponse.token?.isEmpty ?? true) return;
        if (scaffoldState.currentContext != null) {
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


  Future<void> navigateToHomePage() async {
    await navigation.navigateToPageClear(
        path: NavigationConstants.TEMPLATE_VIEW);
  }
}
