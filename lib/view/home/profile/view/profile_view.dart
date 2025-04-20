import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProfileViewModel viewModel) {
        return Padding(
          padding: context.paddingNormal,
          child: Scaffold(
            appBar: AppBar(
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
            ),
            body: Padding(
              padding: context.paddingMediumVertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.home_profile_body_helloText.locale,
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        viewModel.user.firstName as String,
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
