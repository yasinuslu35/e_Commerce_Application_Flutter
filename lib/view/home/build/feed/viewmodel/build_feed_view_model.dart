
import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/view/_product/_utility/decoration_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase extends BaseViewModel with Store {
@override
void setContext(BuildContext context) => myContext = context;
DecorationHelper? helper;
@override
void init() {
  helper = DecorationHelper(myContext);
}

}