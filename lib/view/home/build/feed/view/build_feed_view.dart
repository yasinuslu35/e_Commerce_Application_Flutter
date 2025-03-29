import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/container/random_color_container.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/home/build/feed/viewmodel/build_feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) {
        return Scaffold(
          key: viewModel.scaffoldKey,
          appBar: buildAppBar(viewModel),
          body: DefaultTabController(
            length: 4,
            child: Observer(
              builder: (context) => viewModel.isLoaindg
                  ? buildCenter()
                  : viewModel.houseModels == null ||
                          viewModel.houseModels!.isEmpty
                      ? const Center(
                          child: Text("Not Found"),
                        )
                      : ListView(
                          children: [
                            buildTabBar(viewModel),
                            SizedBox(
                              height: 300,
                              child: PageView.builder(
                                controller: PageController(
                                  viewportFraction: 0.95,
                                ),
                                itemCount: 3,
                                itemBuilder: (context, index) =>
                                    buildStackFloaty(context, viewModel, index),
                              ),
                            ),
                            Text(
                              LocaleKeys.home_build_subTitle.locale,
                              style: context.textTheme.headlineSmall?.copyWith(
                                color: context.colors.onSecondary,
                              ),
                            ),
                            buildListView(viewModel),
                          ],
                        ),
            ),
          ),
        );
      },
    );
  }

  ListView buildListView(BuildFeedViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.houseModels?.length,
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
                  child: buildColumnUserCard(context, viewModel, index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TabBar buildTabBar(BuildFeedViewModel viewModel) {
    return TabBar(
      indicator: viewModel.helper.circleDecoration,
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
    );
  }

  Center buildCenter() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar buildAppBar(BuildFeedViewModel viewModel) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () async {
          await viewModel.getListAll();
        },
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
    );
  }

  Widget buildStackFloaty(
    BuildContext context,
    BuildFeedViewModel viewModel,
    int index,
  ) {
    return Padding(
      padding: context.paddingLowHorizontal,
      child: Stack(
        children: [
          const Positioned.fill(
            bottom: 100,
            child: RandomColorContainer(),
          ),
          Positioned(
            top: 150,
            left: 10,
            right: 10,
            child: Card(
              child: Padding(
                padding: context.paddingLow,
                child: buildColumnUserCard(context, viewModel, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildColumnUserCard(
    BuildContext context,
    BuildFeedViewModel viewModel,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(),
          title: Text(viewModel.houseModels?[index].brandName as String),
          subtitle: const Text("Description"),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ),
        Column(
          children: [
            AutoSizeText(
              "Beautiful" * 10,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
            ),
            Text("Description"),
          ],
        ),
      ],
    );
  }
}
