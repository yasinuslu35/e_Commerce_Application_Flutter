// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_data_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDataResult _$ErrorDataResultFromJson(Map<String, dynamic> json) =>
    ErrorDataResult(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorDataResultToJson(ErrorDataResult instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      password: json['password'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'password': instance.password,
      'username': instance.username,
    };
