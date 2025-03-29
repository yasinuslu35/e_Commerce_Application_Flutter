import 'package:e_commerce_application/core/base/model/base_model.dart';

class SuccessDataResult<T extends BaseModel<T>?>{
  final String? message;
  final int? statusCode;
  final T? data;

  SuccessDataResult({
    required this.statusCode,
    this.data,
    this.message,
  });
}
