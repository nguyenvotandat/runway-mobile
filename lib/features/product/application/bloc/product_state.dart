part of 'product_bloc.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.loadingDetail() = ProductLoadingDetail;
  const factory ProductState.loadingMore(PaginatedProducts paginatedProducts) =
      ProductLoadingMore;
  const factory ProductState.loaded(PaginatedProducts paginatedProducts) =
      ProductLoaded;
  const factory ProductState.detailLoaded(Product product) =
      ProductDetailLoaded;
  const factory ProductState.error(String message) = ProductError;
}
