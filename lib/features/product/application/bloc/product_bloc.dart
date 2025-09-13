import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/paginated_products_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/usecases/get_product_detail_usecase.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductBloc({
    required this.getProductsUseCase,
    required this.getProductDetailUseCase,
  }) : super(const ProductState.initial()) {
    on<ProductEvent>((event, emit) async {
      await event.when(
        getProductsRequested: (filter, page, limit) =>
            _onGetProductsRequested(emit, filter, page, limit),
        getProductDetailRequested: (id) =>
            _onGetProductDetailRequested(emit, id),
        loadMoreProductsRequested: (filter, page, limit) =>
            _onLoadMoreProductsRequested(emit, filter, page, limit),
      );
    });
  }

  Future<void> _onGetProductsRequested(
    Emitter<ProductState> emit,
    ProductFilter? filter,
    int page,
    int limit,
  ) async {
    emit(const ProductState.loading());

    final result = await getProductsUseCase(
      filter: filter,
      page: page,
      limit: limit,
    );

    result.fold(
      (failure) => emit(ProductState.error(failure.message)),
      (paginatedProducts) => emit(ProductState.loaded(paginatedProducts)),
    );
  }

  Future<void> _onGetProductDetailRequested(
    Emitter<ProductState> emit,
    String id,
  ) async {
    emit(const ProductState.loadingDetail());

    final result = await getProductDetailUseCase(id);

    result.fold(
      (failure) => emit(ProductState.error(failure.message)),
      (product) => emit(ProductState.detailLoaded(product)),
    );
  }

  Future<void> _onLoadMoreProductsRequested(
    Emitter<ProductState> emit,
    ProductFilter? filter,
    int page,
    int limit,
  ) async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      emit(ProductState.loadingMore(currentState.paginatedProducts));

      final result = await getProductsUseCase(
        filter: filter,
        page: page,
        limit: limit,
      );

      result.fold((failure) => emit(ProductState.error(failure.message)), (
        newPaginatedProducts,
      ) {
        final allProducts = [
          ...currentState.paginatedProducts.products,
          ...newPaginatedProducts.products,
        ];

        final updatedPaginatedProducts = PaginatedProducts(
          products: allProducts,
          total: newPaginatedProducts.total,
          page: newPaginatedProducts.page,
          limit: newPaginatedProducts.limit,
          totalPages: newPaginatedProducts.totalPages,
        );

        emit(ProductState.loaded(updatedPaginatedProducts));
      });
    }
  }
}
