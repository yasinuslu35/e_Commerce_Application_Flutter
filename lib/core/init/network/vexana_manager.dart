import 'dart:io';

import 'package:vexana/vexana.dart';

class VexanaManager {
  VexanaManager._init();

  static VexanaManager? _instace;

  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _iosBaseUrl = 'http://localhost:3000/';
  static const String _androidBaseUrl = 'http://10.0.2.2:3000/';

  INetworkManager networkManager = NetworkManager<EmptyModel>(
    isEnableLogger: true,
    options: BaseOptions(
      baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl,
    ),
  );
}
