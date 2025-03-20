import 'package:e_commerce_application/core/base/model/base_model.dart';
import 'package:e_commerce_application/core/constants/enums/http_request_enum.dart';
import 'package:e_commerce_application/core/init/network/IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> myFetch<R,T extends BaseModel>(
      String path, {
        required HttpTypes type,
        required T parseModel,
        dynamic data,
        Map<String, dynamic>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}