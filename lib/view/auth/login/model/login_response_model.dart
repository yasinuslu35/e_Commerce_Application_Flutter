import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class BaseEntityModel extends INetworkModel<BaseEntityModel> {
  final int? statusCode;
  final String? message;
  final LoginResponseModel? data;

  const BaseEntityModel({
    this.statusCode,
    this.message,
    this.data,
  });

  @override
  BaseEntityModel fromJson(Map<String, dynamic> json) {
    return BaseEntityModel.fromJson(json);
  }


  factory BaseEntityModel.fromJson(Map<String, dynamic> json) =>
      _$BaseEntityModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() {
    return _$BaseEntityModelToJson(this);
  }
}


@JsonSerializable()
class LoginResponseModel extends INetworkModel<LoginResponseModel> {
  final String? token;
  final double? expiresIn;

  const LoginResponseModel({this.token, this.expiresIn});

  @override
  LoginResponseModel fromJson(Map<String, Object?> json) {
    return LoginResponseModel.fromJson(json);
  }

  factory LoginResponseModel.fromJson(Map<String, Object?> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
