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
  Future<DataResult<UserResponseModel>?> fetchUserControl(
      LoginRequestModel model) async {
    final response = await manager.send<BaseEntityModel, BaseEntityModel>(
      NetworkRoutes.LOGIN.rawValue,
      urlSuffix: "login",
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
      return null;
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

/*
  @override
  Future<void> sendTokenToBackend(String idToken) async {
    // Burada token'ı backend'e göndereceksin
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/auth/google'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'idToken': idToken}),
    );
    print('response.statusCode ${response.statusCode}');
    print('response.body ${response.body}');
    if (response.statusCode == 200) {
      print('Token doğrulandı');
      // Backend'den gelen sonucu işle
    } else {
      print('Token doğrulama başarısız');
    }
  }

   */
}
