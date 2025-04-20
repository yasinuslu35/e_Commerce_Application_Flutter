import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseEntityModel extends INetworkModel<BaseEntityModel> {
  final int? statusCode;
  final String? message;
  final UserResponseModel? data;

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

@JsonSerializable(explicitToJson: true)
class UserResponseModel extends INetworkModel<UserResponseModel> {
  final int id;
  final String firstName;
  final String lastName;
  final String? birthDate;
  final String? address;
  final String? city;
  final String? country;
  final String? phone;
  final String createdAt;
  final String updatedAt;
  final LoginResponseModel loginResponse;

  const UserResponseModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.birthDate,
    this.address,
    this.city,
    this.country,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.loginResponse,
  });

  @override
  UserResponseModel fromJson(Map<String, dynamic> json) {
    return UserResponseModel.fromJson(json);
  }

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() {
    return _$UserResponseModelToJson(this);
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
