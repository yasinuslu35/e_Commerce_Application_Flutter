import 'package:vexana/vexana.dart';

class ErrorResult extends INetworkModel<ErrorResult> {

  final int? statusCode;
  final String? message;

  const ErrorResult({
    this.statusCode,
    this.message,
  });

  @override
  ErrorResult fromJson(Map<String, dynamic> json) => ErrorResult.fromJson(json);

  factory ErrorResult.fromJson(Map<String, dynamic> json) {
    return ErrorResult(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson() => _toJson();

  Map<String, dynamic> _toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
    };
  }

  ErrorResult copyWith({
    int? statusCode,
    String? message,
  }) {
    return ErrorResult(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }
}
