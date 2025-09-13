// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(
  Map<String, dynamic> json,
) => _ProductModel(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  brandId: json['brandId'] as String,
  categoryId: json['categoryId'] as String,
  description: json['description'] as String?,
  glbUrl: json['glbUrl'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  brand: json['brand'] == null
      ? null
      : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
  category: json['category'] == null
      ? null
      : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  variants:
      (json['variants'] as List<dynamic>?)
          ?.map((e) => ProductVariantModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ProductImageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  ratingAverage: (json['ratingAverage'] as num?)?.toDouble(),
  ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'brandId': instance.brandId,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'glbUrl': instance.glbUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'brand': instance.brand,
      'category': instance.category,
      'variants': instance.variants,
      'images': instance.images,
      'ratingAverage': instance.ratingAverage,
      'ratingCount': instance.ratingCount,
    };
