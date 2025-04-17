import 'dart:io';

import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:vexana/vexana.dart';

class VexanaManager {

  static const String _iosBaseUrl = 'http://localhost:8080/api/';
  static const String _androidBaseUrl = 'http://10.0.2.2:8080/api/';


  INetworkManager networkManager = NetworkManager<ErrorDataResult>(
    errorModel: const ErrorDataResult(),
    isEnableLogger: true,
    options: BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl,
    ),

  );
}
