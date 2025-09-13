import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_price_entity.dart';

part 'price_model.freezed.dart';
part 'price_model.g.dart';

@freezed
abstract class PriceModel with _$PriceModel {
  const factory PriceModel({
    required String id,
    required String variantId,
    required String amount,
    @Default('VND') String currency,
    DateTime? validFrom,
  }) = _PriceModel;

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
}

extension PriceModelMapper on PriceModel {
  ProductPriceEntity toEntity() {
    return ProductPriceEntity(
      amount: double.tryParse(amount) ?? 0.0,
      currency: currency,
    );
  }
}
