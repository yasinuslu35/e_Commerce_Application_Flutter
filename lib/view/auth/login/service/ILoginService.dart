import '../model/login_request_model.dart';
import '../model/login_response_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager manager;
  ILoginService(this.manager);

  Future<LoginResponseModel?> fetchUserControl(LoginRequestModel model);
}