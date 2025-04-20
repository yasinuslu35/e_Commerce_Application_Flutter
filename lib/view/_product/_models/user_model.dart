import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_model.g.dart'; // Bu dosya otomatik olarak oluşturulacak.

@JsonSerializable(explicitToJson: true)
class UserModel extends INetworkModel<UserModel> {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? birthDate;
  final String? address;
  final String? city;
  final String? country;
  final String? phone;
  final String? createdAt;
  final String? updatedAt;
  final LoginResponse? loginResponse;

  const UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.address,
    this.city,
    this.country,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.loginResponse,
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() {
    return _$UserModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class LoginResponse extends INetworkModel<LoginResponse>{
  final String? token;
  final int? expiresIn;

  const LoginResponse({
    this.token,
    this.expiresIn,
  });

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse.fromJson(json);
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginResponseToJson(this);
  }

}
