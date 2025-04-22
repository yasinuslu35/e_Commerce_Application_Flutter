import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/core/init/notifier/user_notifier.dart';
import 'package:e_commerce_application/view/_product/_models/user_model.dart';
import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase extends BaseViewModel
    with Store, ServiceHelper {
  @override
  void setContext(BuildContext context) => myContext = context;

  final List<String> orderTexts = [
    LocaleKeys.home_profile_body_orders_toPay.locale,
    LocaleKeys.home_profile_body_orders_toReceive.locale,
    LocaleKeys.home_profile_body_orders_toReview.locale,
  ];

  final double rating = 3;
  final double size = 16;
  final Color filledColor = Colors.amber;
  final Color unfilledColor = Colors.grey;
  late List<Widget> starList;

  late UserModel _user;

  UserModel get user => _user;

  @override
  void init() {
    _user = Provider.of<UserNotifier>(myContext).user!;
    starList = List.generate(
      5,
      (index) {
        final IconData icon;
        final Color color;
        if (rating >= index + 1) {
          icon = Icons.star;
          color = filledColor;
        } else if (rating > index && rating < index + 1) {
          icon = Icons.star_half;
          color = filledColor;
        } else {
          icon = Icons.star_border;
          color = unfilledColor;
        }

        return Icon(
          icon,
          color: color,
          size: size,
        );
      },
    );
  }
}
