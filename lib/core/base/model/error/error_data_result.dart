import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'error_data_result.g.dart';

@JsonSerializable()
class ErrorDataResult extends INetworkModel<ErrorDataResult> {
  final int? statusCode;
  final String? message;
  final dynamic data;

  const ErrorDataResult({
    this.statusCode,
    this.message,
    this.data,
  });

  @override
  ErrorDataResult fromJson(Map<String, dynamic> json) =>
      ErrorDataResult.fromJson(json);

  factory ErrorDataResult.fromJson(Map<String, dynamic> json) {
    return _$ErrorDataResultFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ErrorDataResultToJson(this);
  }

  ErrorDataResult copyWith({
    int? statusCode,
    String? message,
    dynamic data,
  }) {
    return ErrorDataResult(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}
