// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) =>
    _InventoryModel(
      variantId: json['variantId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      safetyStock: (json['safetyStock'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$InventoryModelToJson(_InventoryModel instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'quantity': instance.quantity,
      'safetyStock': instance.safetyStock,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
