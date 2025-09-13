import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_size_entity.dart';

part 'product_size_model.freezed.dart';
part 'product_size_model.g.dart';

@freezed
abstract class ProductSizeModel with _$ProductSizeModel {
  const factory ProductSizeModel({required String id, required String label}) =
      _ProductSizeModel;

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSizeModelFromJson(json);
}

extension ProductSizeModelMapper on ProductSizeModel {
  ProductSizeEntity toEntity() {
    return ProductSizeEntity(id: id, label: label);
  }
}
