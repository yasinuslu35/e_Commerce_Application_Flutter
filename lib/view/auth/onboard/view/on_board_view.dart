import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/text/auto_locale_text.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/_product/_widgets/list_view/on_board_indicator.dart';
import 'package:e_commerce_application/view/auth/onboard/model/on_board_model.dart';
import 'package:e_commerce_application/view/auth/onboard/viewmodel/on_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) {
        return Scaffold(
          body: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              children: [
                const Spacer(flex: 1),
                Expanded(flex: 5, child: buildPageView(viewModel)),
                Expanded(
                  flex: 2,
                  child: buildRowFooter(viewModel),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemBuilder: (context, index) {
        return buildColumnBody(context, viewModel.onBoardItems[index]);
      },
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Observer(
            builder: (context) => OnBoardIndicator(
              defaultWidth: context.width * 0.015,
              itemCount: viewModel.onBoardItems.length,
              currentIndex: viewModel.currentPageIndex,
            ),
          ),
        ),
        const Spacer(),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }

  /*
  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: context.paddingLow,
                              child: const CircleAvatar(),
                            );
                          },
                        ),
   */

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: buildSvgPicture(model.imagePath),
        ),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingNormalHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        ),
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: context.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: context.colors.onSecondary,
      ),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: context.textTheme.titleMedium,
    );
  }

  SvgPicture buildSvgPicture(String path) {
    return SvgPicture.asset(
      path,
    );
  }
}
