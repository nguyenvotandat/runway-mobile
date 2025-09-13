import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_color_entity.dart';

part 'product_color_model.freezed.dart';
part 'product_color_model.g.dart';

@freezed
abstract class ProductColorModel with _$ProductColorModel {
  const factory ProductColorModel({
    required String id,
    required String name,
    required String hex,
  }) = _ProductColorModel;

  factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
      _$ProductColorModelFromJson(json);
}

extension ProductColorModelMapper on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(id: id, name: name, hex: hex);
  }
}
