import 'package:e_commerce_application/view/home/build/feed/model/brand_response_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class IBuildFeedService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;
  IBuildFeedService(this.manager, this.scaffoldyKey);

  Future<List<Data>?> fetchUserHouseList();
}