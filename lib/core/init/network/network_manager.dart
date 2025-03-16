import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_application/core/base/model/base_error.dart';
import 'package:e_commerce_application/core/base/model/base_model.dart';
import 'package:e_commerce_application/core/constants/enums/locale_keys_enum.dart';
import 'package:e_commerce_application/core/init/cache/locale_manager.dart';

class NetworkManager {
  static NetworkManager? _instance = NetworkManager._init();

  static NetworkManager? get instance => _instance;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "http://localhost:8080/api",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );
    _dio = Dio(baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.path += "yasin"; // BUNU SONRADAN DÜZENLEMEN GEREKİCEK
        },
        onError: (error, handler) {
          final baseError =
              BaseError(message: error.message ?? "Bilinmeyen Hata");
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              response: error.response,
              type: error.type,
              error: baseError,
            ),
          );
        },
      ),
    );
  }

  late Dio _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody
              .map((e) => model.fromJson(e))
              .toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody as Map<String, dynamic>);
        }
        return responseBody;
    }
  }
}
