import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_image_entity.dart';

part 'product_image_model.freezed.dart';
part 'product_image_model.g.dart';

@freezed
abstract class ProductImageModel with _$ProductImageModel {
  const factory ProductImageModel({
    required String id,
    required String url,
    @Default(0) int sortOrder,
  }) = _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);
}

extension ProductImageModelMapper on ProductImageModel {
  ProductImageEntity toEntity() {
    return ProductImageEntity(id: id, url: url, sortOrder: sortOrder);
  }
}
