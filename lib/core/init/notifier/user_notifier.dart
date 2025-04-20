import 'dart:convert';

import 'package:e_commerce_application/core/init/cache/locale_manager.dart';
import 'package:e_commerce_application/view/_product/_constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/view/_product/_models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier extends ChangeNotifier{

  UserModel? _user;
  LocaleManager localeManager = LocaleManager.instance;
  UserModel? get user => _user;

  Future<void> setUser() async{

    String userJson = localeManager.getStringValue(PreferencesKeys.USER);
    if (userJson.isNotEmpty) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      _user = UserModel.fromJson(userMap);
      notifyListeners();
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
