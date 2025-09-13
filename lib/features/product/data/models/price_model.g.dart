// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => _PriceModel(
  id: json['id'] as String,
  variantId: json['variantId'] as String,
  amount: json['amount'] as String,
  currency: json['currency'] as String? ?? 'VND',
  validFrom: json['validFrom'] == null
      ? null
      : DateTime.parse(json['validFrom'] as String),
);

Map<String, dynamic> _$PriceModelToJson(_PriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variantId': instance.variantId,
      'amount': instance.amount,
      'currency': instance.currency,
      'validFrom': instance.validFrom?.toIso8601String(),
    };
