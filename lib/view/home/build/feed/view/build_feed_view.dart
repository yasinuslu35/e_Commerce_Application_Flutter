import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/container/random_color_container.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/home/build/feed/viewmodel/build_feed_view_model.dart';
import 'package:flutter/material.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.format_align_center,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              )
            ],
          ),
          body: DefaultTabController(
            length: 4,
            child: ListView(
              children: [
                TabBar(
                  indicator: viewModel.helper?.circleDecoration,
                  indicatorSize: TabBarIndicatorSize.label,
                  //isScrollable: true,
                  tabs: [
                    Tab(
                      text: LocaleKeys.home_build_tabBar_tab1.locale,
                    ),
                    Tab(
                      text: LocaleKeys.home_build_tabBar_tab2.locale,
                    ),
                    Tab(
                      text: LocaleKeys.home_build_tabBar_tab3.locale,
                    ),
                    Tab(
                      text: LocaleKeys.home_build_tabBar_tab4.locale,
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      const Positioned.fill(
                        bottom: 100,
                        left: 10,
                        right: 10,
                        child: RandomColorContainer(),
                      ),
                      Positioned(
                        top: 150,
                        left: 25,
                        right: 25,
                        child: Container(
                          color: context.randomColor,
                          child: Padding(
                            padding: context.paddingLow,
                            child: buildColumnUserCard(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  LocaleKeys.home_build_subTitle.locale,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: context.colors.onSecondary,
                  ),
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: context.height * 0.15,
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: buildColumnUserCard(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column buildColumnUserCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(),
          title: const Text("data"),
          subtitle: const Text("Description"),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ),
        Text(
          "Beautiful",
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text("Description"),
      ],
    );
  }
}
