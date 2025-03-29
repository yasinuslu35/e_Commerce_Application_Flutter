part './response_parser/core_operations.dart';
/*
class CoreDio extends ICoreDioNullSafety<BaseModel> with DioMixin implements Dio  {
  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = IOHttpClientAdapter();
  }

  @override
  final BaseOptions options;

  @override
  Future<DataResult<R?,E?>> send<R, T extends BaseModel>(
    String path, {
    required HttpTypes type,
    required T parseModel,
    data,
    Map<String, Object>? queryParameters,
    void Function(int p1, int p2)? onReceiveProgress,
  }) async {
    final response = await request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        method: type.rawValue,
      ),
      onReceiveProgress: onReceiveProgress,
    );
    switch (response.statusCode) {
      case HttpStatus.OK:
      case HttpStatus.accepted:
        final model = _responseParser(parseModel, data);
        return DataResult(success: true, data: model);
      default:
        final model = _responseParser(parseModel, data);
        return DataResult(message: 'Something went wrong', success: false,data: model);
    }
  }
}


 */