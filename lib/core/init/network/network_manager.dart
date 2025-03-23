import 'package:dio/dio.dart';
import 'package:vexana/vexana.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance = NetworkManager._init();

  //INetworkManager manager;
  static NetworkManager? get instance => _instance;

  late ICoreDioNullSafety coreDio;


  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "http://localhost:8080/api",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );
    coreDio = CoreDio(options: baseOptions);

  }
}

