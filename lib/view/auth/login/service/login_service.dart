import 'package:e_commerce_application/core/base/model/base/data_result.dart';
import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:e_commerce_application/view/_product/enum/network_route_enum.dart';
import 'package:e_commerce_application/view/auth/login/model/login_request_model.dart';
import 'package:e_commerce_application/view/auth/login/model/login_response_model.dart';
import 'package:e_commerce_application/view/auth/login/service/ILoginService.dart';
import 'package:vexana/vexana.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(super.manager, super.scaffoldKey);

  @override
  Future<DataResult<LoginResponseModel>?> fetchUserControl(
      LoginRequestModel model) async {
    final response = await manager.send<BaseEntityModel, BaseEntityModel>(
      NetworkRoutes.LOGIN.rawValue,
      urlSuffix: "login",
      parseModel: const BaseEntityModel(),
      method: RequestType.POST,
      data: model,
    );
    final errorModel = response.error?.model;

    if (response.data?.data is LoginResponseModel) {
      showMessage(scaffoldKey, response.data?.toJson());
      return DataResult(data: response.data?.data);
      //return response.data?.data;
    } else if (response.error != null) {
      if (errorModel is ErrorDataResult) {
        if (errorModel.data == null) {
          showMessage(scaffoldKey, response.error?.model?.toJson());
        } else {
          showMessage(scaffoldKey, errorModel.data?.toJson());
        }
      }
      return DataResult(error: response.error?.model);
    } else {
      showMessage(scaffoldKey, response.error?.model?.toJson());
      return DataResult(error: response.error?.model);
    }
  }
}
