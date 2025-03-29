import 'package:dio/dio.dart';
import 'package:e_commerce_application/core/base/model/base/data_result.dart';
import 'package:e_commerce_application/core/base/model/base_model.dart';
import 'package:e_commerce_application/core/constants/enums/http_request_enum.dart';

abstract class ICoreDio<E extends BaseModel<E>>{
  Future<DataResult<R?,E?>> fetch<R, T extends BaseModel>(
      String path, {
        required HttpTypes type,
        required T parseModel,
        dynamic data,
        Map<String, Object>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}
// MARK: Null SAfety

abstract class ICoreDioNullSafety<E extends BaseModel<E>> {
  Future<DataResult<R?,E?>> send<R, T extends BaseModel<T>>(
      String path, {
        required T parseModel,
        required HttpTypes method,
        String? urlSuffix,
        Map<String, dynamic>? queryParameters,
        Options? options,
        Duration? expiration,
        dynamic data,
        ProgressCallback? onReceiveProgress,
        CancelToken? cancelToken,
        bool isErrorDialog = false,
      });
}
/*
abstract class ICoreDioFull extends ICoreDio {
  Future<DataResult<R>> fetchNoNetwork<R, T extends BaseModel>(
      String path, {
        required HttpTypes type,
        required T parseModel,
        dynamic data,
        Map<String, Object>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}

// MARK: Nul SAfety
abstract class ICoreDioFullNulSafetyFull extends ICoreDioNullSafety {
  Future<DataResult<R>> fetchNoNetwork<R, T extends BaseModel>(
      String path, {
        required HttpTypes type,
        required T parseModel,
        dynamic data,
        Map<String, Object>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}

 */