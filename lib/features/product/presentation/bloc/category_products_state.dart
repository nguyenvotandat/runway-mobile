import 'package:runway_mobile/features/product/domain/entities/product_entity.dart';

abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsLoaded extends CategoryProductsState {
  final List<ProductEntity> products;

  CategoryProductsLoaded(this.products);
}