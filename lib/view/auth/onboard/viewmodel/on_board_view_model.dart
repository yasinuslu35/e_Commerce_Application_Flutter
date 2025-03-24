import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_constants/image_path_svg.dart';
import 'package:e_commerce_application/view/auth/onboard/model/on_board_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {
    myContext = context;
  }

  List<OnBoardModel> onBoardItems = [];

  @override
  void init() {
    onBoardItems.add(
      OnBoardModel(
        LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_description,
        SVGImage.instance.astronautSVG,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_description,
        SVGImage.instance.chatSVG,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_description,
        SVGImage.instance.relaxSVG,
      ),
    );
  }

  @observable
  int currentPageIndex = 0;

  @action
  void onPageChanged(int value) {
    currentPageIndex = value;
  }
}
