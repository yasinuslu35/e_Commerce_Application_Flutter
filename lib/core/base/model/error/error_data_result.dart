

import 'package:e_commerce_application/core/base/model/base_model.dart';

abstract class ErrorDataResult<T extends BaseModel<T>?>{
  final String? message;
  final int? statusCode;
  final T? data;

  ErrorDataResult({
    required this.statusCode,
    this.data,
    this.message,
  });
}
