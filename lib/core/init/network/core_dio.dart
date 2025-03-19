import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_application/core/base/model/base_error.dart';
import 'package:e_commerce_application/core/base/model/base_model.dart';
import 'package:e_commerce_application/core/constants/enums/http_request_enum.dart';
import 'package:e_commerce_application/core/extension/network_extension.dart';
import 'package:e_commerce_application/core/init/network/ICoreDio.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
  }

  @override
  Future<R> myFetch<R,T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    Object? data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        return _responseParser<R>(parseModel, _responseParser);
      default:
        return BaseError(message: response.statusMessage) as dynamic;
    }
  }

  R _responseParser<R>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R;
  }
}
