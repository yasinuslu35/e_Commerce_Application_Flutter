import 'package:vexana/vexana.dart';

class DataResult<R>
    extends INetworkModel<DataResult> {
  final R? data;
  final INetworkModel<dynamic>? error;

  const DataResult({
    this.data,
    this.error,
  });

  @override
  DataResult<R> fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
