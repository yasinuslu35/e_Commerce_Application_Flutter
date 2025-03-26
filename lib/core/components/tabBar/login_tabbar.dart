import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';

class LoginTabbar extends StatelessWidget {
  final List<Widget> tabs;

  const LoginTabbar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      labelStyle: context.textTheme.headlineSmall,
      labelColor: Colors.black,
      unselectedLabelStyle: context.textTheme.headlineSmall,
      unselectedLabelColor: context.colors.onSurface,
      indicatorColor: context.colors.onError,
      indicatorWeight: 5,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: tabs,
    );
  }
}
