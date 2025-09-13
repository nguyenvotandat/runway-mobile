import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_model.dart';
import '../../domain/entities/paginated_products_entity.dart';

part 'paginated_products_model.freezed.dart';
part 'paginated_products_model.g.dart';

@freezed
abstract class PaginatedProductsModel with _$PaginatedProductsModel {
  const factory PaginatedProductsModel({
    required List<ProductModel> data,
    required int total,
    required int page,
    required int limit,
    required int totalPages,
    @Default(false) bool hasNext,
    @Default(false) bool hasPrev,
  }) = _PaginatedProductsModel;

  factory PaginatedProductsModel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProductsModelFromJson(json);
}

// Extension Mapper
extension PaginatedProductsModelMapper on PaginatedProductsModel {
  PaginatedProductsEntity toEntity() {
    return PaginatedProductsEntity(
      products: data.map((product) => product.toEntity()).toList(),
      total: total,
      page: page,
      limit: limit,
      totalPages: totalPages,
      hasNext: hasNext,
      hasPrev: hasPrev,
    );
  }
}
