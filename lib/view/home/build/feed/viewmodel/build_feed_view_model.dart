import 'package:e_commerce_application/core/base/model/base_view_model.dart';
import 'package:e_commerce_application/view/_product/_utility/decoration_helper.dart';
import 'package:e_commerce_application/view/home/build/feed/model/brand_response_model.dart';
import 'package:e_commerce_application/view/home/build/feed/service/IBuildFeedService.dart';
import 'package:e_commerce_application/view/home/build/feed/service/build_feed_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase extends BaseViewModel with Store {
  @override
  void setContext(BuildContext context) => myContext = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late DecorationHelper helper;
  late IBuildFeedService feedService;
  @observable
  List<String> likeItems = [];

  @action
  void onLikeItemPressed(String id) {
    if (likeItems.contains(id)) {
      likeItems.remove(id);
    } else {
      likeItems.add(id);
    }

    likeItems = likeItems;
  }

  @observable
  List<Data>? houseModels;

  @observable
  bool isLoaindg = false;

  @override
  void init() {
    helper = DecorationHelper(context: myContext);
    feedService = BuildFeedService(vexanaManager.networkManager, scaffoldKey);
  }

  @action
  void _changeLoading() {
    isLoaindg = !isLoaindg;
  }

  @action
  Future<void> getListAll() async {
    _changeLoading();
    houseModels = await feedService.fetchUserHouseList();
    _changeLoading();
  }
}
