// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductVariantModel _$ProductVariantModelFromJson(Map<String, dynamic> json) =>
    _ProductVariantModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
      colorId: json['colorId'] as String,
      sizeId: json['sizeId'] as String,
      sku: json['sku'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      color: json['color'] == null
          ? null
          : ProductColorModel.fromJson(json['color'] as Map<String, dynamic>),
      size: json['size'] == null
          ? null
          : ProductSizeModel.fromJson(json['size'] as Map<String, dynamic>),
      inventory: json['inventory'] == null
          ? null
          : InventoryModel.fromJson(json['inventory'] as Map<String, dynamic>),
      prices:
          (json['prices'] as List<dynamic>?)
              ?.map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductVariantModelToJson(
  _ProductVariantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'colorId': instance.colorId,
  'sizeId': instance.sizeId,
  'sku': instance.sku,
  'status': instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'color': instance.color,
  'size': instance.size,
  'inventory': instance.inventory,
  'prices': instance.prices,
};
