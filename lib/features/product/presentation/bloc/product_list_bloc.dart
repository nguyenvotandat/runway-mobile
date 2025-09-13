import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/paginated_products_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_products_usecase.dart';

// Events
abstract class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductListEvent {
  final ProductFilter? filter;
  final bool refresh;

  const LoadProducts({this.filter, this.refresh = false});

  @override
  List<Object?> get props => [filter, refresh];
}

class LoadMoreProducts extends ProductListEvent {
  const LoadMoreProducts();
}

class RefreshProducts extends ProductListEvent {
  final ProductFilter? filter;

  const RefreshProducts({this.filter});

  @override
  List<Object?> get props => [filter];
}

class ApplyFilter extends ProductListEvent {
  final ProductFilter filter;

  const ApplyFilter(this.filter);

  @override
  List<Object?> get props => [filter];
}

class ClearFilter extends ProductListEvent {
  const ClearFilter();
}

// States
abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object?> get props => [];
}

class ProductListInitial extends ProductListState {
  const ProductListInitial();
}

class ProductListLoading extends ProductListState {
  const ProductListLoading();
}

class ProductListRefreshing extends ProductListState {
  final List<Product> products;

  const ProductListRefreshing(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductListLoadingMore extends ProductListState {
  final List<Product> products;
  final int currentPage;
  final bool hasMore;

  const ProductListLoadingMore({
    required this.products,
    required this.currentPage,
    required this.hasMore,
  });

  @override
  List<Object?> get props => [products, currentPage, hasMore];
}

class ProductListLoaded extends ProductListState {
  final List<Product> products;
  final int currentPage;
  final int totalPages;
  final int total;
  final bool hasMore;
  final ProductFilter? appliedFilter;

  const ProductListLoaded({
    required this.products,
    required this.currentPage,
    required this.totalPages,
    required this.total,
    required this.hasMore,
    this.appliedFilter,
  });

  @override
  List<Object?> get props => [
    products,
    currentPage,
    totalPages,
    total,
    hasMore,
    appliedFilter,
  ];

  ProductListLoaded copyWith({
    List<Product>? products,
    int? currentPage,
    int? totalPages,
    int? total,
    bool? hasMore,
    ProductFilter? appliedFilter,
  }) {
    return ProductListLoaded(
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      total: total ?? this.total,
      hasMore: hasMore ?? this.hasMore,
      appliedFilter: appliedFilter ?? this.appliedFilter,
    );
  }
}

class ProductListEmpty extends ProductListState {
  final String message;
  final ProductFilter? appliedFilter;

  const ProductListEmpty({
    this.message = 'Không có sản phẩm nào',
    this.appliedFilter,
  });

  @override
  List<Object?> get props => [message, appliedFilter];
}

class ProductListError extends ProductListState {
  final String message;
  final List<Product> products;

  const ProductListError({required this.message, this.products = const []});

  @override
  List<Object?> get props => [message, products];
}

// Bloc
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductsUseCase getProductsUseCase;

  static const int _pageLimit = 10;

  ProductListBloc({required this.getProductsUseCase})
    : super(const ProductListInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadMoreProducts>(_onLoadMoreProducts);
    on<RefreshProducts>(_onRefreshProducts);
    on<ApplyFilter>(_onApplyFilter);
    on<ClearFilter>(_onClearFilter);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductListState> emit,
  ) async {
    if (event.refresh && state is ProductListLoaded) {
      emit(ProductListRefreshing((state as ProductListLoaded).products));
    } else {
      emit(const ProductListLoading());
    }

    final result = await getProductsUseCase(
      filter: event.filter,
      page: 1,
      limit: _pageLimit,
    );

    result.fold((failure) => emit(ProductListError(message: failure.message)), (
      paginatedProducts,
    ) {
      if (paginatedProducts.products.isEmpty) {
        emit(ProductListEmpty(appliedFilter: event.filter));
      } else {
        emit(
          ProductListLoaded(
            products: paginatedProducts.products,
            currentPage: paginatedProducts.page,
            totalPages: paginatedProducts.totalPages,
            total: paginatedProducts.total,
            hasMore: paginatedProducts.hasNext,
            appliedFilter: event.filter,
          ),
        );
      }
    });
  }

  Future<void> _onLoadMoreProducts(
    LoadMoreProducts event,
    Emitter<ProductListState> emit,
  ) async {
    if (state is! ProductListLoaded) return;

    final currentState = state as ProductListLoaded;
    if (!currentState.hasMore) return;

    emit(
      ProductListLoadingMore(
        products: currentState.products,
        currentPage: currentState.currentPage,
        hasMore: currentState.hasMore,
      ),
    );

    final result = await getProductsUseCase(
      filter: currentState.appliedFilter,
      page: currentState.currentPage + 1,
      limit: _pageLimit,
    );

    result.fold(
      (failure) => emit(
        ProductListError(
          message: failure.message,
          products: currentState.products,
        ),
      ),
      (paginatedProducts) {
        final allProducts = [
          ...currentState.products,
          ...paginatedProducts.products,
        ];

        emit(
          ProductListLoaded(
            products: allProducts,
            currentPage: paginatedProducts.page,
            totalPages: paginatedProducts.totalPages,
            total: paginatedProducts.total,
            hasMore: paginatedProducts.hasNext,
            appliedFilter: currentState.appliedFilter,
          ),
        );
      },
    );
  }

  Future<void> _onRefreshProducts(
    RefreshProducts event,
    Emitter<ProductListState> emit,
  ) async {
    add(LoadProducts(filter: event.filter, refresh: true));
  }

  Future<void> _onApplyFilter(
    ApplyFilter event,
    Emitter<ProductListState> emit,
  ) async {
    add(LoadProducts(filter: event.filter));
  }

  Future<void> _onClearFilter(
    ClearFilter event,
    Emitter<ProductListState> emit,
  ) async {
    add(const LoadProducts());
  }
}
