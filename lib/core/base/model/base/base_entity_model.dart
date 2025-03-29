abstract class BaseEntityModel<T> {
  final int? statusCode;
  final String? message;
  final T? data;

  const BaseEntityModel({
    this.statusCode,
    this.message,
    this.data,
  });
}
