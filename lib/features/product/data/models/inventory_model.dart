import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_inventory_entity.dart';

part 'inventory_model.freezed.dart';
part 'inventory_model.g.dart';

@freezed
abstract class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    required String variantId,
    required int quantity,
    required int safetyStock,
    required DateTime updatedAt,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}

extension InventoryModelMapper on InventoryModel {
  ProductInventoryEntity toEntity() {
    return ProductInventoryEntity(
      quantity: quantity,
      safetyStock: safetyStock,
      updatedAt: updatedAt,
    );
  }
}
