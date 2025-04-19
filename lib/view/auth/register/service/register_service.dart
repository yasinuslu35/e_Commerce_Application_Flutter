
import 'package:e_commerce_application/core/base/model/base/data_result.dart';
import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:e_commerce_application/view/_product/enum/network_route_enum.dart';
import 'package:e_commerce_application/view/auth/login/model/login_response_model.dart';
import 'package:e_commerce_application/view/auth/register/model/register_request_model.dart';
import 'package:e_commerce_application/view/auth/register/model/user_exist_model.dart';
import 'package:e_commerce_application/view/auth/register/service/IRegisterService.dart';
import 'package:vexana/vexana.dart';


class RegisterService extends IRegisterService with ServiceHelper {

  RegisterService(super.manager, super.scaffoldKey);


  @override
  Future<DataResult<UserExistModel>?> isUserExist(String username) async {
    final response = await manager.send<UserExistModel, UserExistModel>(
      NetworkRoutes.LOGIN.rawValue,
      urlSuffix: "signup",
      //queryParameters: ,
      parseModel: const UserExistModel(),
      method: RequestType.GET,
    );
    final errorModel = response.error?.model;
    final successModel = response.data?.data;
    if (successModel != null) {
      //return DataResult(data: successModel);
      return null;
    } else if (errorModel != null) {
      if (errorModel is ErrorDataResult) {
        return DataResult(error: errorModel);
      }
      return DataResult(error: errorModel);
    } else {
      ErrorDataResult errorDataResult = const ErrorDataResult(
          statusCode: 500,
          message: "Bağlantı sağlanamadı. Lütfen tekrar deneyin."
      );
      return DataResult(error: errorDataResult);
    }
  }

  @override
  Future<DataResult<UserResponseModel>?> fetchUserControl(
      RegisterRequestModel model) async {
    final response = await manager.send<BaseEntityModel, BaseEntityModel>(
      NetworkRoutes.LOGIN.rawValue,
      urlSuffix: "signup",
      parseModel: const BaseEntityModel(),
      method: RequestType.POST,
      data: model,
    );
    final errorModel = response.error?.model;
    final successModel = response.data?.data;
    if (successModel != null) {
      return DataResult(data: successModel);
    } else if (errorModel != null) {
      if (errorModel is ErrorDataResult) {
        return DataResult(error: errorModel);
      }
      return DataResult(error: errorModel);
    } else {
      ErrorDataResult errorDataResult = const ErrorDataResult(
          statusCode: 500,
          message: "Bağlantı sağlanamadı. Lütfen tekrar deneyin."
      );
      return DataResult(error: errorDataResult);
    }
  }

  @override
  Future<DataResult<UserResponseModel>?> googleSignIn(String idToken) async {
    final response = await manager.send<BaseEntityModel, BaseEntityModel>(
      NetworkRoutes.LOGIN.rawValue,
      urlSuffix: "google",
      parseModel: const BaseEntityModel(),
      method: RequestType.POST,
      data: idToken,
    );
    final errorModel = response.error?.model;
    final successModel = response.data?.data;
    if (successModel != null) {
      return DataResult(data: successModel);
    } else if (errorModel != null) {
      if (errorModel is ErrorDataResult) {
        return DataResult(error: errorModel);
      }
      return DataResult(error: errorModel);
    } else {
      return null;
    }
  }

}