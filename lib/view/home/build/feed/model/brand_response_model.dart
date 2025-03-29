import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'brand_response_model.g.dart';

@JsonSerializable()
class BrandResponseModel extends INetworkModel<BrandResponseModel> {
  final bool? success;
  final String? message;
  final List<Data>? data;

  const BrandResponseModel({this.success, this.message, this.data});

  /// Factory constructor - Build Runner bunu kullanacak
  factory BrandResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BrandResponseModelToJson(this);

  /// INetworkModel için override edilen fromJson
  @override
  BrandResponseModel fromJson(Map<String, dynamic> json) {
    return BrandResponseModel.fromJson(json);
  }
}

@JsonSerializable()
class Data extends INetworkModel<Data> {
  final String? brandName;
  final List<Products>? products;

  const Data({this.brandName, this.products});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  Data fromJson(Map<String, dynamic> json) {
    return Data.fromJson(json);
  }
}

@JsonSerializable()
class Products extends INetworkModel<Products> {
  final int? productId;
  final String? productName;
  final String? categoryName;

  const Products({this.productId, this.productName, this.categoryName});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  @override
  Products fromJson(Map<String, dynamic> json) {
    return Products.fromJson(json);
  }
}
