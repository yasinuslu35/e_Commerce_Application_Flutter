
import '../../init/network/IResponseModel.dart';

class BaseError<T> extends IErrorModel<T>{
  final String? message;

  BaseError({required this.message});

}