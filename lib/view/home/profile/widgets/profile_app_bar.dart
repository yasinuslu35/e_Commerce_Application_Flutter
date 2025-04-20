import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Container(
        width: context.width * 0.3,
        height: context.width * 0.1,
        decoration: BoxDecoration(
          color: context.myColors.appBlue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            LocaleKeys.home_profile_appBar_text.locale,
            style: TextStyle(
              color: context.myColors.white,
              fontSize: context.width * 0.05,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          highlightColor: Colors.transparent,
          iconSize: context.width * 0.07,
          icon: Icon(
            Symbols.redeem,
            //FontAwesomeIcons.ticket,
            color: context.myColors.appBlue,
          ),
        ),
        IconButton(
          onPressed: () {},
          highlightColor: Colors.transparent,
          iconSize: context.width * 0.07,
          icon: Icon(
            Icons.message,
            color: context.myColors.appBlue,
          ),
        ),
        IconButton(
          onPressed: () {},
          highlightColor: Colors.transparent,
          iconSize: context.width * 0.07,
          icon: Icon(
            Icons.settings,
            color: context.myColors.appBlue,
          ),
        ),
      ],
      leading: CircleAvatar(
        backgroundColor: Colors.white.withValues(
          alpha: 1,
        ),
        child: AnimatedOpacity(
          opacity: 1,
          duration: context.lowDuration,
          //child:Text("ASDASD"),
        ),
      ),
    );
  }
}
