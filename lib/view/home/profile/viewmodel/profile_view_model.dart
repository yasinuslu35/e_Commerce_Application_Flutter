
import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/init/notifier/user_notifier.dart';
import 'package:e_commerce_application/view/_product/_models/user_model.dart';
import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase extends BaseViewModel with Store, ServiceHelper {


  @override
  void setContext(BuildContext context) => myContext = context;


  late UserModel _user;

  UserModel get user => _user;
  @override
  void init() {
    _user = Provider.of<UserNotifier>(myContext).user!;
  }
}