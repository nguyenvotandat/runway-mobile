// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductImageModel _$ProductImageModelFromJson(Map<String, dynamic> json) =>
    _ProductImageModel(
      id: json['id'] as String,
      url: json['url'] as String,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProductImageModelToJson(_ProductImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'sortOrder': instance.sortOrder,
    };
