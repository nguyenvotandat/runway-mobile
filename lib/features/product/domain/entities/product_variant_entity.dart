import 'package:equatable/equatable.dart';
import 'product_color_entity.dart';
import 'product_size_entity.dart';
import 'product_inventory_entity.dart';
import 'product_price_entity.dart';

class ProductVariantEntity extends Equatable {
  final String id;
  final String productId;
  final String colorId;
  final String sizeId;
  final String sku;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ProductColorEntity? color;
  final ProductSizeEntity? size;
  final ProductInventoryEntity? inventory;
  final List<ProductPriceEntity> prices;

  const ProductVariantEntity({
    required this.id,
    required this.productId,
    required this.colorId,
    required this.sizeId,
    required this.sku,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.color,
    this.size,
    this.inventory,
    this.prices = const [],
  });

  @override
  List<Object?> get props => [
    id,
    productId,
    colorId,
    sizeId,
    sku,
    status,
    createdAt,
    updatedAt,
    color,
    size,
    inventory,
    prices,
  ];
}
