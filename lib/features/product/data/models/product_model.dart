import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:runway_mobile/features/catalog/data/models/category_model.dart';
import 'package:runway_mobile/features/catalog/domain/entities/category_entity.dart';
import 'package:runway_mobile/features/product/data/models/brand_model.dart';
import 'package:runway_mobile/features/product/data/models/product_image_model.dart';
import 'package:runway_mobile/features/product/data/models/product_variant_model.dart';
import 'package:runway_mobile/features/product/domain/entities/brand_entity.dart';
import 'package:runway_mobile/features/product/domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

// Main Product Model
@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required String slug,
    required String brandId,
    required String categoryId,
    String? description,
    String? glbUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    BrandModel? brand,
    CategoryModel? category,
    @Default([]) List<ProductVariantModel> variants,
    @Default([]) List<ProductImageModel> images,
    double? ratingAverage,
    @Default(0) int ratingCount,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

// Extension Mapper để convert từ Model sang Entity
extension ProductModelMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      slug: slug,
      description: description,
      glbUrl: glbUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      brand: brand?.toEntity() ?? BrandEntity(id: brandId, name: ''),
      category:
          category?.toEntity() ?? CategoryEntity(id: categoryId, name: ''),
      categoryId: categoryId,
      variants: variants.map((variant) => variant.toEntity()).toList(),
      images: images.map((img) => img.toEntity()).toList(),
      ratingAverage: ratingAverage,
      ratingCount: ratingCount,
    );
  }
}
