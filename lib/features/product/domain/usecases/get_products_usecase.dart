import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/paginated_products_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, PaginatedProducts>> call({
    ProductFilter? filter,
    int page = 1,
    int limit = 10,
  }) async {
    return await repository.getProducts(
      filter: filter,
      page: page,
      limit: limit,
    );
  }
}
