import 'package:dartz/dartz.dart';
import '../entities/paginated_products_entity.dart';
import '../repositories/product_repository.dart';
import '../../../../core/errors/failures.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, PaginatedProductsEntity>> call({
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
