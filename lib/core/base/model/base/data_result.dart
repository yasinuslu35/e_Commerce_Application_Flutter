import 'package:e_commerce_application/core/base/model/base_model.dart';
import 'package:e_commerce_application/core/base/model/error/error_data_result.dart';
import 'package:vexana/vexana.dart';

class DataResult<R, E extends BaseModel<E>?> extends INetworkModel<DataResult>{
  final R? data;
  final ErrorDataResult<E>? error;
  final int statusCode;
  final String? message;

  const DataResult({
    required this.statusCode,
    this.message,
    this.data,
    this.error,
  });

  @override
  DataResult<dynamic, BaseModel?> fromJson(Map<String, dynamic> json) {

    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
