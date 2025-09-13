part of 'product_bloc.dart';

@freezed
abstract class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getProductsRequested({
    ProductFilter? filter,
    @Default(1) int page,
    @Default(10) int limit,
  }) = ProductGetProductsRequested;

  const factory ProductEvent.getProductDetailRequested(String id) =
      ProductGetProductDetailRequested;

  const factory ProductEvent.loadMoreProductsRequested({
    ProductFilter? filter,
    required int page,
    @Default(10) int limit,
  }) = ProductLoadMoreProductsRequested;
}
