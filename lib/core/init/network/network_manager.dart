import 'package:dio/dio.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance = NetworkManager._init();

  static NetworkManager? get instance => _instance;

  ICoreDioNullSafety? coreDio;


  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "http://localhost:8080/api",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );
    //_dio = Dio(baseOptions);
    coreDio = CoreDio(baseOptions);

    /*
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
    */
  }
}

/*
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
*/
