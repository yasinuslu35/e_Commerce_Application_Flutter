// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_data_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDataResult _$ErrorDataResultFromJson(Map<String, dynamic> json) =>
    ErrorDataResult(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$ErrorDataResultToJson(ErrorDataResult instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
