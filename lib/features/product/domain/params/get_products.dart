// Params class cho GetProductsUseCase
import 'package:runway_mobile/features/product/domain/repositories/product_repository.dart';

class GetProductsParams {
  final ProductFilter? filter;
  final int page;
  final int limit;

  const GetProductsParams({this.filter, this.page = 1, this.limit = 10});

  // Factory constructor với validation
  factory GetProductsParams.create({
    ProductFilter? filter,
    int? page,
    int? limit,
  }) {
    final validPage = page ?? 1;
    final validLimit = limit ?? 10;

    // ✅ Validation logic
    if (validPage < 1) {
      throw ArgumentError('Page phải lớn hơn 0');
    }
    if (validLimit < 1 || validLimit > 100) {
      throw ArgumentError('Limit phải từ 1 đến 100');
    }

    return GetProductsParams(
      filter: filter,
      page: validPage,
      limit: validLimit,
    );
  }
}