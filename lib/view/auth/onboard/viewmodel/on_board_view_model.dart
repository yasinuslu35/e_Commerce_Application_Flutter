import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/core/constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/core/constants/navigation/navigation_constants.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/_product/_constants/image_constants.dart';
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

  late PageController pageController;
  List<OnBoardModel> onBoardItems = [];

  @override
  void init() {
    pageController = PageController();
    onBoardItems.add(
      OnBoardModel(
        title: LocaleKeys.onBoard_page1_title,
        description: LocaleKeys.onBoard_page1_description,
        imagePath: ImageConstants.instance.onBoard1,
        upTextButton: LocaleKeys.onBoard_page1_upTextButton,
        downTextButton: LocaleKeys.onBoard_page1_downTextButton,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        title: LocaleKeys.onBoard_page2_title,
        description: LocaleKeys.onBoard_page2_description,
        imagePath: ImageConstants.instance.onBoard2,
        upTextButton: LocaleKeys.onBoard_page2_upTextButton,
        downTextButton: LocaleKeys.onBoard_page2_downTextButton,
        prevTextButton: LocaleKeys.onBoard_page2_prevTextButton,
      ),
    );
    onBoardItems.add(
      OnBoardModel(
        title: LocaleKeys.onBoard_page3_title,
        description: LocaleKeys.onBoard_page3_description,
        imagePath: ImageConstants.instance.onBoard3,
        upTextButton: LocaleKeys.onBoard_page3_upTextButton,
        downTextButton: LocaleKeys.onBoard_page3_downTextButton,
        prevTextButton: LocaleKeys.onBoard_page2_prevTextButton,
      ),
    );
  }

  @observable
  int currentPageIndex = 0;

  @observable
  bool isLoading = false;

  @action
  void onPageChanged(int value) {
    currentPageIndex = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBooleanValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
  }

  @action
  void prevButton() {
    pageController.animateToPage(
      currentPageIndex- 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @action
  void nextButton() {
    if (currentPageIndex == onBoardItems.length - 1) {
      completeToOnBoard();
    } else {
      pageController.animateToPage(
        currentPageIndex+ 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
