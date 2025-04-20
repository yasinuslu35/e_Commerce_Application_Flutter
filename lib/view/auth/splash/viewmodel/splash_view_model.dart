import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/init/cache/locale_manager.dart';
import 'package:e_commerce_application/core/init/notifier/user_notifier.dart';
import 'package:e_commerce_application/view/_product/_constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/view/_product/_constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => myContext = context;

  @observable
  late bool isFirstApp;



  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  bool isTokenValid() {
    final double tokenExpireDate =
        localeManager.getDoubleValue(PreferencesKeys.EXPIRE_DATE);

    if (tokenExpireDate == 0.0) {
      return false;
    }

    final currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    if(currentTimestamp > tokenExpireDate) {
      return false;
    }
    else {
      return true;
    }
  }

  @override
  Future<void> init() async {
    await LocaleManager.preferencesInit();
    isFirstApp = localeManager.getBooleanValue(PreferencesKeys.IS_FIRST_APP);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (isFirstApp) {
        navigate(path: NavigationConstants.ON_BOARD);
      } else {
        if(isTokenValid()) {
          await Provider.of<UserNotifier>(myContext,listen: false).setUser();
          navigate(path: NavigationConstants.TEMPLATE_VIEW);
        }
        else {
          localeManager.removeValue(PreferencesKeys.USER);
          localeManager.removeValue(PreferencesKeys.EXPIRE_DATE);
          localeManager.removeValue(PreferencesKeys.TOKEN);
          navigate(path: NavigationConstants.LOGIN_VIEW);
        }

      }
    });
  }


  Future<void> navigate({required String path}) async {
    await navigation.navigateToPageClear(path: path);
  }
}
