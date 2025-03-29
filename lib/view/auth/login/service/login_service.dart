import 'package:e_commerce_application/view/_product/_utility/service_helper.dart';
import 'package:e_commerce_application/view/_product/enum/network_route_enum.dart';
import 'package:e_commerce_application/view/auth/login/model/login_request_model.dart';
import 'package:e_commerce_application/view/auth/login/model/login_response_model.dart';
import 'package:e_commerce_application/view/auth/login/service/ILoginService.dart';
import 'package:vexana/vexana.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(super.manager,super.scaffoldKey);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginRequestModel model) async {
    final response = await manager.send<BaseEntityModel, BaseEntityModel>(
      NetworkRoutes.LOGIN.rawValue,
      urlSuffix: "login",
      parseModel: const BaseEntityModel(),
      method: RequestType.POST,
      data: model,
      options: Options(
        validateStatus: (status) {
          return status! < 500; // 500'den küçük olan tüm status kodları hata olarak görülmez
        },
      ),

    );
    print("response = ${response.data?.data}");
    if (response.data?.data is LoginResponseModel) {
      print("response.data = ${response.data}");
      showMessage(scaffoldKey, response.error);
      return response.data?.data;
    } else {
      showMessage(scaffoldKey, response.error);
      return response.data?.data;
    }
  }
}

// BEFORE: null safety before
// @override
// Future<LoginResponseModel> fetchUserControl(LoginModel model) async {
//   final response = await manager.fetch<LoginResponseModel, LoginResponseModel>(NetworkRoutes.LOGIN.rawValue,
//       parseModel: LoginResponseModel(), method: RequestType.POST, data: model);

//   if (response.data is LoginResponseModel) {
//     return response.data;
//   } else {
//     return null;
//   }
// }