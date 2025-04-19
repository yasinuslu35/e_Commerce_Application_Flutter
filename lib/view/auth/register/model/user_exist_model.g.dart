// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_exist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserExistModel _$UserExistModelFromJson(Map<String, dynamic> json) =>
    UserExistModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] as bool?,
    );

Map<String, dynamic> _$UserExistModelToJson(UserExistModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
