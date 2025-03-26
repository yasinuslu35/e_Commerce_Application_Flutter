import 'package:e_commerce_application/core/components/tabBar/login_tabbar.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class LoginTabbarBusiness extends StatelessWidget {
  final List<Widget> tabs;

  const LoginTabbarBusiness({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: context.paddingMediumHorizontal.add(
          const EdgeInsets.only(bottom: 5),
        ),
        child: LoginTabbar(
          tabs: tabs,
        ),
      ),
    );
  }
}
