import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends INetworkModel<RegisterRequestModel> {
  final String username;
  final String password;
  final String passwordConfirm;
  final String? firstName;
  final String? lastName;

  const RegisterRequestModel({
    required this.username,
    required this.password,
    required this.passwordConfirm,
    this.firstName,
    this.lastName,
  });

  @override
  RegisterRequestModel fromJson(Map<String, Object?> json) {
    return _$RegisterRequestModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RegisterRequestModelToJson(this);
  }
}
