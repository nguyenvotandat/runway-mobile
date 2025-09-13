// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedProductsModel _$PaginatedProductsModelFromJson(
  Map<String, dynamic> json,
) => _PaginatedProductsModel(
  data: (json['data'] as List<dynamic>)
      .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  hasNext: json['hasNext'] as bool? ?? false,
  hasPrev: json['hasPrev'] as bool? ?? false,
);

Map<String, dynamic> _$PaginatedProductsModelToJson(
  _PaginatedProductsModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
  'hasNext': instance.hasNext,
  'hasPrev': instance.hasPrev,
};
