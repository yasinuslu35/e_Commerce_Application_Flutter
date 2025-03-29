// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandResponseModel _$BrandResponseModelFromJson(Map<String, dynamic> json) =>
    BrandResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrandResponseModelToJson(BrandResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      brandName: json['brandName'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'brandName': instance.brandName,
      'products': instance.products,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      productId: (json['productId'] as num?)?.toInt(),
      productName: json['productName'] as String?,
      categoryName: json['categoryName'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'categoryName': instance.categoryName,
    };
