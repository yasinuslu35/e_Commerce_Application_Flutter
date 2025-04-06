import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/text/auto_locale_text.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_widgets/button/onBoard_text_button.dart';
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
          appBar: buildAppBar(viewModel),
          body: Padding(
            padding: context.paddingNormalHorizontal,
            child: Column(
              children: [
                const Spacer(flex: 1),
                Expanded(flex: 5, child: buildPageView(viewModel)),
                Expanded(
                  flex: 2,
                  child: buildRowFooter(context, viewModel),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar(OnBoardViewModel viewModel) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: buildAppBarText(viewModel),
      actions: [
        OnboardTextButton(
          viewModel: viewModel,
          buttonType: LocaleKeys.onBoard_page1_upTextButton,
          onPressed: viewModel.completeToOnBoard,
          color: Colors.black,
        ),
      ],
    );
  }

  Observer buildAppBarText(OnBoardViewModel viewModel) {
    return Observer(
      builder: (context) => Padding(
        padding: context.paddingLow,
        child: Text(
          "${viewModel.currentPageIndex + 1}/3",
          style: TextStyle(
            fontSize: context.width * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      controller: viewModel.pageController,
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemBuilder: (context, index) {
        return buildColumnBody(context, viewModel.onBoardItems[index]);
      },
    );
  }

  Row buildRowFooter(BuildContext context, OnBoardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildPrevButton(viewModel),
        buildIndicator(viewModel),
        Observer(
          builder: (context) {
            return Visibility(
              visible: viewModel.isLoading,
              child: const CircularProgressIndicator(),
            );
          },
        ),
        buildTextButton(context, viewModel),
      ],
    );
  }

  Observer buildPrevButton(OnBoardViewModel viewModel) {
    return Observer(
      builder: (context) => viewModel.currentPageIndex == 0
          ? const SizedBox()
          : OnboardTextButton(
              viewModel: viewModel,
              buttonType: LocaleKeys.onBoard_page2_prevTextButton,
              onPressed: () {
                viewModel.prevButton();
              },
              color: Colors.grey,
            ),
    );
  }

  Widget buildTextButton(BuildContext context, OnBoardViewModel viewModel) {
    return Observer(
      builder: (context) => OnboardTextButton(
        viewModel: viewModel,
        buttonType:
            viewModel.onBoardItems[viewModel.currentPageIndex].downTextButton,
        onPressed: () {
          viewModel.nextButton();
        },
      ),
    );
  }

  Observer buildIndicator(OnBoardViewModel viewModel) {
    return Observer(
      builder: (context) => OnBoardIndicator(
        itemCount: viewModel.onBoardItems.length,
        currentIndex: viewModel.currentPageIndex,
      ),
    );
  }

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
