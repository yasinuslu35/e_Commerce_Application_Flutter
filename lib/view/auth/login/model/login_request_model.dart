import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends INetworkModel<LoginRequestModel> {
  final String? username;
  final String? password;

  const LoginRequestModel({
    this.username,
    this.password,
  });

  @override
  LoginRequestModel fromJson(Map<String, Object?> json) {
    return _$LoginRequestModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginRequestModelToJson(this);
  }
}
