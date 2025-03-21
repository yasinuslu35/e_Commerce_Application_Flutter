import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/view/auth/onboard/model/on_board_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) {
    this.myContext = context;
  }

  @override
  void init() {
    onBoardModel = List.generate(
      5,
      (index) => OnBoardModel(
        text: index.toString(),
      ),
    );
  }

  late List<OnBoardModel> onBoardModel;
}
