import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/auth/onboard/viewmodel/on_board_view_model.dart';
import 'package:flutter/material.dart';

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
        body: PageView.builder(
          itemCount: value.onBoardModel.length,
          itemBuilder: (context, index) {
            return Container(
              color: context.randomColor,
              child: Column(
                children: [
                  Placeholder(),
                  Text(value.onBoardModel[index].text),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
