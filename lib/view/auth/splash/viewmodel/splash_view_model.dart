import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase extends BaseViewModel with Store {
@override
void setContext(BuildContext context) => this.myContext = context;
@override
void init() {}

}