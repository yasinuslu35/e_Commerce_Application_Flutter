import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/column/form_column.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/_product/_widgets/list_view/on_board_indicator.dart';
import 'package:e_commerce_application/view/auth/onboard/viewmodel/on_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  late OnBoardViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel value) => Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 9,
              // PageView.builder içinde ayrıştırma işlemi yapılabilir.
              //Bir ara yaparsın unutma aşağıdaki listView gibi.
              child: buildPageView(),
            ),
            Expanded(
              flex: 1,
              child: buildObserverIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Observer buildObserverIndicator() {
    return Observer(
      builder: (context) => OnBoardIndicator(
        itemCount: viewModel.onBoardModel.length,
        currentIndex: viewModel.currentPageIndex,
      ),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemCount: viewModel.onBoardModel.length,
      itemBuilder: (context, index) {
        return Container(
          color: context.randomColor,
          child: FormColumn(
            children: [
              const Placeholder(),
              Text(viewModel.onBoardModel[index].text),
            ],
          ),
        );
      },
    );
  }
}
