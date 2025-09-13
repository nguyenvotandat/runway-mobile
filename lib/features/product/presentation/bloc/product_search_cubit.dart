import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/search_products_usecase.dart';
import '../../domain/usecases/get_featured_products_usecase.dart';

// States
abstract class ProductSearchState extends Equatable {
  const ProductSearchState();

  @override
  List<Object?> get props => [];
}

class ProductSearchInitial extends ProductSearchState {
  final List<Product> featuredProducts;

  const ProductSearchInitial({this.featuredProducts = const []});

  @override
  List<Object?> get props => [featuredProducts];
}

class ProductSearchLoading extends ProductSearchState {
  final String query;

  const ProductSearchLoading(this.query);

  @override
  List<Object?> get props => [query];
}

class ProductSearchLoaded extends ProductSearchState {
  final String query;
  final List<Product> results;
  final int resultCount;

  const ProductSearchLoaded({
    required this.query,
    required this.results,
    required this.resultCount,
  });

  @override
  List<Object?> get props => [query, results, resultCount];
}

class ProductSearchEmpty extends ProductSearchState {
  final String query;
  final String message;

  const ProductSearchEmpty({
    required this.query,
    this.message = 'Không tìm thấy sản phẩm nào',
  });

  @override
  List<Object?> get props => [query, message];
}

class ProductSearchError extends ProductSearchState {
  final String query;
  final String message;

  const ProductSearchError({required this.query, required this.message});

  @override
  List<Object?> get props => [query, message];
}

class FeaturedProductsLoading extends ProductSearchState {
  const FeaturedProductsLoading();
}

class FeaturedProductsLoaded extends ProductSearchState {
  final List<Product> products;

  const FeaturedProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class FeaturedProductsError extends ProductSearchState {
  final String message;

  const FeaturedProductsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class ProductSearchCubit extends Cubit<ProductSearchState> {
  final SearchProductsUseCase searchProductsUseCase;
  final GetFeaturedProductsUseCase getFeaturedProductsUseCase;

  ProductSearchCubit({
    required this.searchProductsUseCase,
    required this.getFeaturedProductsUseCase,
  }) : super(const ProductSearchInitial());

  Future<void> loadFeaturedProducts() async {
    emit(const FeaturedProductsLoading());

    final result = await getFeaturedProductsUseCase(limit: 8);

    result.fold(
      (failure) => emit(FeaturedProductsError(failure.message)),
      (products) => emit(FeaturedProductsLoaded(products)),
    );
  }

  Future<void> searchProducts(String query) async {
    if (query.trim().isEmpty) {
      loadFeaturedProducts();
      return;
    }

    emit(ProductSearchLoading(query.trim()));

    final result = await searchProductsUseCase(query.trim());

    result.fold(
      (failure) => emit(
        ProductSearchError(query: query.trim(), message: failure.message),
      ),
      (products) {
        if (products.isEmpty) {
          emit(ProductSearchEmpty(query: query.trim()));
        } else {
          emit(
            ProductSearchLoaded(
              query: query.trim(),
              results: products,
              resultCount: products.length,
            ),
          );
        }
      },
    );
  }

  void clearSearch() {
    emit(const ProductSearchInitial());
    loadFeaturedProducts();
  }

  void reset() {
    emit(const ProductSearchInitial());
  }
}
