import 'package:e_commerce_application/core/base/model/base/data_result.dart';
import 'package:e_commerce_application/view/auth/login/model/login_response_model.dart';
import 'package:e_commerce_application/view/auth/register/model/register_request_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';



abstract class IRegisterService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IRegisterService(this.manager, this.scaffoldKey);

  Future<DataResult<UserResponseModel>?> fetchUserControl(RegisterRequestModel model);

  Future<DataResult<UserResponseModel>?> googleSignIn(String idToken);

}
