import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/brand_entity.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
abstract class BrandModel with _$BrandModel {
  const factory BrandModel({required String id, required String name}) =
      _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

extension BrandModelMapper on BrandModel {
  BrandEntity toEntity() {
    return BrandEntity(id: id, name: name);
  }
}
