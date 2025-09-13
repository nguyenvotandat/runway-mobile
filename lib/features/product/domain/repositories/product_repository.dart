import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../entities/paginated_products_entity.dart';

class ProductFilter {
  final String? categoryId;
  final String? brandId;
  final double? minPrice;
  final double? maxPrice;
  final String? search;
  final String? colorId;
  final String? sizeId;
  final bool? inStock;

  const ProductFilter({
    this.categoryId,
    this.brandId,
    this.minPrice,
    this.maxPrice,
    this.search,
    this.colorId,
    this.sizeId,
    this.inStock,
  });

  // Helper method to convert to query parameters
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (categoryId != null) params['categoryId'] = categoryId;
    if (brandId != null) params['brandId'] = brandId;
    if (minPrice != null) params['minPrice'] = minPrice;
    if (maxPrice != null) params['maxPrice'] = maxPrice;
    if (search != null) params['search'] = search;
    if (colorId != null) params['colorId'] = colorId;
    if (sizeId != null) params['sizeId'] = sizeId;
    if (inStock != null) params['inStock'] = inStock;

    return params;
  }

  // Helper method to create filter for category
  ProductFilter.byCategory(String categoryId) : this(categoryId: categoryId);

  // Helper method to create filter for brand
  ProductFilter.byBrand(String brandId) : this(brandId: brandId);

  // Helper method to create filter for search
  ProductFilter.bySearch(String search) : this(search: search);

  // Helper method to create filter for price range
  ProductFilter.byPriceRange(double minPrice, double maxPrice)
    : this(minPrice: minPrice, maxPrice: maxPrice);
}

abstract class ProductRepository {
  Future<Either<Failure, PaginatedProductsEntity>> getProducts({
    ProductFilter? filter,
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, ProductEntity>> getProductDetail(String id);

  Future<Either<Failure, List<ProductEntity>>> searchProducts(
    String query, {
    int limit = 20,
  });

  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts({
    int limit = 10,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String categoryId, {
    int limit = 10,
  });
}
