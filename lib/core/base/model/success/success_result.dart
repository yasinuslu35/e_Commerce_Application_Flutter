import 'package:e_commerce_application/core/base/model/base/result.dart';
import 'package:e_commerce_application/core/base/model/base_model.dart';

class SuccessResult<T extends BaseModel> extends Result {
  SuccessResult({
    required super.statusCode,
    super.message,
  });
}
