import 'package:e_commerce_application/core/base/model/base/result.dart';
import 'package:e_commerce_application/core/base/model/base_model.dart';

class ErrorResult<T extends BaseModel> extends Result {
  ErrorResult({
    required super.statusCode,
    super.message
  });
}
