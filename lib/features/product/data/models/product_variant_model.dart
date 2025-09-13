import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:runway_mobile/features/product/domain/entities/product_variant_entity.dart';
import 'product_color_model.dart';
import 'product_size_model.dart';
import 'inventory_model.dart';
import 'price_model.dart';

part 'product_variant_model.freezed.dart';
part 'product_variant_model.g.dart';

@freezed
abstract class ProductVariantModel with _$ProductVariantModel {
  const factory ProductVariantModel({
    required String id,
    required String productId,
    required String colorId,
    required String sizeId,
    required String sku,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    ProductColorModel? color,
    ProductSizeModel? size,
    InventoryModel? inventory,
    @Default([]) List<PriceModel> prices,
  }) = _ProductVariantModel;

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantModelFromJson(json);
}

extension ProductVariantModelMapper on ProductVariantModel {
  ProductVariantEntity toEntity() {
    return ProductVariantEntity(
      id: id,
      productId: productId,
      colorId: colorId,
      sizeId: sizeId,
      sku: sku,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      color: color?.toEntity(),
      size: size?.toEntity(),
      inventory: inventory?.toEntity(),
      prices: prices.map((price) => price.toEntity()).toList(),
    );
  }
}
