import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_exist_model.g.dart';

@JsonSerializable()
class UserExistModel extends INetworkModel<UserExistModel> {
  final int? statusCode;
  final String? message;
  final bool? data;

  const UserExistModel({
    this.statusCode,
    this.message,
    this.data,
  });

  @override
  UserExistModel fromJson(Map<String, dynamic> json) {
    return _$UserExistModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserExistModelToJson(this);
  }
}
