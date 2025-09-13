import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_product_detail_usecase.dart';

// States
abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object?> get props => [];
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  final Product product;
  final int selectedImageIndex;
  final String? selectedColorId;
  final String? selectedSizeId;
  final ProductVariant? selectedVariant;

  const ProductDetailLoaded({
    required this.product,
    this.selectedImageIndex = 0,
    this.selectedColorId,
    this.selectedSizeId,
    this.selectedVariant,
  });

  @override
  List<Object?> get props => [
    product,
    selectedImageIndex,
    selectedColorId,
    selectedSizeId,
    selectedVariant,
  ];

  ProductDetailLoaded copyWith({
    Product? product,
    int? selectedImageIndex,
    String? selectedColorId,
    String? selectedSizeId,
    ProductVariant? selectedVariant,
  }) {
    return ProductDetailLoaded(
      product: product ?? this.product,
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
      selectedColorId: selectedColorId ?? this.selectedColorId,
      selectedSizeId: selectedSizeId ?? this.selectedSizeId,
      selectedVariant: selectedVariant ?? this.selectedVariant,
    );
  }

  // Helper methods
  bool get canAddToCart => selectedVariant?.isAvailable ?? false;
  double? get currentPrice => selectedVariant?.currentPrice;
  int get availableStock => selectedVariant?.inventory?.quantity ?? 0;
  bool get isInStock => selectedVariant?.isAvailable ?? false;
}

class ProductDetailError extends ProductDetailState {
  final String message;

  const ProductDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductDetailCubit({required this.getProductDetailUseCase})
    : super(const ProductDetailInitial());

  Future<void> loadProductDetail(String productId) async {
    emit(const ProductDetailLoading());

    final result = await getProductDetailUseCase(productId);

    result.fold((failure) => emit(ProductDetailError(failure.message)), (
      product,
    ) {
      // Auto select first available variant if exists
      ProductVariant? firstAvailableVariant;
      if (product.variants.isNotEmpty) {
        firstAvailableVariant =
            product.variants.where((v) => v.isAvailable).isNotEmpty
            ? product.variants.firstWhere((v) => v.isAvailable)
            : product.variants.first;
      }

      emit(
        ProductDetailLoaded(
          product: product,
          selectedColorId: firstAvailableVariant?.colorId,
          selectedSizeId: firstAvailableVariant?.sizeId,
          selectedVariant: firstAvailableVariant,
        ),
      );
    });
  }

  void selectImage(int index) {
    if (state is ProductDetailLoaded) {
      final currentState = state as ProductDetailLoaded;
      emit(currentState.copyWith(selectedImageIndex: index));
    }
  }

  void selectColor(String colorId) {
    if (state is ProductDetailLoaded) {
      final currentState = state as ProductDetailLoaded;

      // Find variant with this color and current size (if selected)
      ProductVariant? newVariant =
          currentState.product.variants
              .where(
                (v) =>
                    v.colorId == colorId &&
                    (currentState.selectedSizeId == null ||
                        v.sizeId == currentState.selectedSizeId),
              )
              .isNotEmpty
          ? currentState.product.variants.firstWhere(
              (v) =>
                  v.colorId == colorId &&
                  (currentState.selectedSizeId == null ||
                      v.sizeId == currentState.selectedSizeId),
            )
          : currentState.product.variants
                .where((v) => v.colorId == colorId)
                .isNotEmpty
          ? currentState.product.variants.firstWhere(
              (v) => v.colorId == colorId,
            )
          : null;

      emit(
        currentState.copyWith(
          selectedColorId: colorId,
          selectedSizeId: newVariant?.sizeId,
          selectedVariant: newVariant,
        ),
      );
    }
  }

  void selectSize(String sizeId) {
    if (state is ProductDetailLoaded) {
      final currentState = state as ProductDetailLoaded;

      // Find variant with this size and current color (if selected)
      ProductVariant? newVariant =
          currentState.product.variants
              .where(
                (v) =>
                    v.sizeId == sizeId &&
                    (currentState.selectedColorId == null ||
                        v.colorId == currentState.selectedColorId),
              )
              .isNotEmpty
          ? currentState.product.variants.firstWhere(
              (v) =>
                  v.sizeId == sizeId &&
                  (currentState.selectedColorId == null ||
                      v.colorId == currentState.selectedColorId),
            )
          : currentState.product.variants
                .where((v) => v.sizeId == sizeId)
                .isNotEmpty
          ? currentState.product.variants.firstWhere((v) => v.sizeId == sizeId)
          : null;

      emit(
        currentState.copyWith(
          selectedSizeId: sizeId,
          selectedColorId: newVariant?.colorId,
          selectedVariant: newVariant,
        ),
      );
    }
  }

  void selectVariant(String variantId) {
    if (state is ProductDetailLoaded) {
      final currentState = state as ProductDetailLoaded;

      final variant =
          currentState.product.variants
              .where((v) => v.id == variantId)
              .isNotEmpty
          ? currentState.product.variants.firstWhere((v) => v.id == variantId)
          : null;

      if (variant != null) {
        emit(
          currentState.copyWith(
            selectedColorId: variant.colorId,
            selectedSizeId: variant.sizeId,
            selectedVariant: variant,
          ),
        );
      }
    }
  }

  void refresh(String productId) {
    loadProductDetail(productId);
  }
}
