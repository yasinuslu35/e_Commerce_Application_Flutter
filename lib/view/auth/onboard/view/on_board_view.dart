import 'package:e_commerce_application/core/base/view/base_view.dart';
import 'package:e_commerce_application/core/components/container/random_color_container.dart';
import 'package:e_commerce_application/view/_product/_constants/image_path_svg.dart';
import 'package:e_commerce_application/view/auth/onboard/viewmodel/on_board_view_model.dart';
import 'package:flutter/material.dart';
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
          body: Column(
            children: [
              Expanded(
                flex: 5,
                child: SvgPicture.asset(
                  SVGImage.instance.relaxSVG,
                ),
              ),
              Expanded(
                flex: 3,
                child: RandomColorContainer(),
              ),
              Expanded(
                flex: 2,
                child: RandomColorContainer(),
              ),
            ],
          ),
        );
      },
    );
  }
}
