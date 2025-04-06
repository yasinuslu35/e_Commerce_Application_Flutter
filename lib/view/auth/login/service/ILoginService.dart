import 'package:e_commerce_application/core/base/model/base/data_result.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';


abstract class ILoginService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  ILoginService(this.manager, this.scaffoldKey);

  Future<DataResult<LoginResponseModel>?> fetchUserControl(LoginRequestModel model);
}
