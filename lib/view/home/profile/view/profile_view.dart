import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_widgets/cards/items_card.dart';
import 'package:e_commerce_application/view/_product/_widgets/circle_avatar/circle_avatar.dart';
import 'package:e_commerce_application/view/_product/_widgets/title/items_title_row.dart';
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
        final appBar = buildAppBar(context);
        final helloText = buildHelloText(context, viewModel);
        return Padding(
          padding: context.paddingNormal,
          child: Scaffold(
            appBar: appBar,
            body: Padding(
              padding: context.paddingMediumVertical,
              child: ListView(
                children: [
                  helloText,
                  SizedBox(
                    height: context.width * 0.03,
                  ),
                  Card(
                    color: const Color(0xffF8F8F8),
                    child: ListTile(
                      title: Text(
                        "Announcement",
                        style: context.textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        "subtitleeeeeee",
                        style: context.textTheme.bodyMedium,
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          size: context.width * 0.08,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: context.paddingLow,
                          backgroundColor: context.myColors.appBlue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.width * 0.03,
                  ),
                  Text(
                    LocaleKeys.home_profile_body_titleViewedText.locale,
                    style: context.textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: context.width * 0.03,
                  ),
                  SizedBox(
                    height: context.height * 0.08,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 50,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const ProductCircleAvatar();
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.width * 0.03,
                  ),
                  Text(
                    LocaleKeys.home_profile_body_titleOrderText.locale,
                    style: context.textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: context.width * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      viewModel.orderTexts.length,
                      (index) =>
                          buildOrderCard(context, viewModel.orderTexts[index]),
                    ),
                  ),
                  ItemsCard(
                    viewModel: viewModel,
                    titleText:
                        LocaleKeys.home_profile_body_items_newItemsText.locale,
                  ),
                  ItemsCard(
                    viewModel: viewModel,
                    titleText: LocaleKeys
                        .home_profile_body_items_mostPopularText.locale,
                  ),
                  SizedBox(
                    height: context.width * 0.03,
                  ),
                  const ItemsTitleRow(
                    titleText:
                        LocaleKeys.home_profile_body_items_categoriesText,
                  ),
                  Wrap(
                    children: List.generate(
                      4,
                      (index) {
                        return LayoutBuilder(
                          builder: (context, constraints) => SizedBox(
                            height: constraints.maxWidth * 0.6,
                            width: constraints.maxWidth / 2,
                            child: Card(
                              color: context.randomColor,
                              child: Wrap(
                                children: [
                                  ...List.generate(
                                    4,
                                    (index) {
                                      return LayoutBuilder(
                                        builder: (context, constraints) =>
                                            SizedBox(
                                          height: constraints.maxWidth / 2,
                                          width: constraints.maxWidth / 2,
                                          child: Card(
                                            color: context.randomColor,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Deneme",
                                          style: context.textTheme.titleMedium,
                                        ),
                                        Container(
                                          width: constraints.maxWidth * 0.13,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            "100",
                                            textAlign: TextAlign.center,
                                            style:
                                                context.textTheme.titleMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Card buildOrderCard(BuildContext context, String text) {
    return Card(
      color: const Color(0xffE5EBFC),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: context.paddingLow,
        child: Text(
          text,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: context.myColors.appBlue,
          ),
        ),
      ),
    );
  }

  Text buildHelloText(BuildContext context, ProfileViewModel viewModel) {
    return Text(
      "${LocaleKeys.home_profile_body_titleHelloText.locale}${viewModel.user.firstName}!",
      style: context.textTheme.headlineLarge,
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
      leading: const ProductCircleAvatar(),
    );
  }
}
