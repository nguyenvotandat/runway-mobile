import 'package:equatable/equatable.dart';
import 'package:runway_mobile/features/catalog/domain/entities/category_entity.dart';
import 'package:runway_mobile/features/product/domain/entities/brand_entity.dart';
import 'package:runway_mobile/features/product/domain/entities/product_image_entity.dart';
import 'package:runway_mobile/features/product/domain/entities/product_variant_entity.dart';


class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String? description;
  final String? glbUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BrandEntity brand;
  final String brandId;
  final CategoryEntity category;
  final String categoryId;
  final List<ProductVariantEntity> variants;
  final List<ProductImageEntity> images;
  final double? ratingAverage;
  final int ratingCount;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.glbUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.brand,
    required this.brandId,
    required this.category,
    required this.categoryId,
    this.variants = const [],
    this.images = const [],
    this.ratingAverage,
    this.ratingCount = 0,
  });



  
  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    description,
    glbUrl,
    createdAt,
    updatedAt,
    brand,
    brandId,
    category,
    categoryId,
    variants,
    images,
    ratingAverage,
    ratingCount,
  ];
}
