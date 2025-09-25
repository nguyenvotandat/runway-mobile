import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runway_mobile/features/product/data/models/get_products_by_category_params.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_by_category_usecase.dart';
import '../../../../core/bloc/base_bloc.dart';

// Events
abstract class CategoryProductsEvent {}

class LoadCategoryProducts extends CategoryProductsEvent {
  final String categoryId;
  final int limit;

  LoadCategoryProducts({required this.categoryId, this.limit = 10});
}

// States
abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsSuccess extends CategoryProductsState {
  final List<ProductEntity> products;

  CategoryProductsSuccess(this.products);
}

class CategoryProductsError extends CategoryProductsState {
  final String message;

  CategoryProductsError(this.message);
}

// Bloc
class CategoryProductsBloc
    extends BaseBloc<CategoryProductsEvent, CategoryProductsState> {
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;

  CategoryProductsBloc(this._getProductsByCategoryUseCase)
    : super(CategoryProductsInitial()) {
    on<LoadCategoryProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadCategoryProducts event,
    Emitter<CategoryProductsState> emit,
  ) async {
    emit(CategoryProductsLoading());

    // ✅ Sử dụng helper từ BaseBloc - tự động handle tất cả errors
    await handleEitherResult(
      emit,
      () => _getProductsByCategoryUseCase.call(
        GetProductsByCategory(
          categoryId: event.categoryId,
          limit: event.limit,
        ),
      ),
      (products) => CategoryProductsSuccess(products),
      (message) => CategoryProductsError(message),
    );
  }
}
