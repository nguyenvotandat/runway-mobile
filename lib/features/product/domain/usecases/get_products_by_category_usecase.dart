import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/paginated_products_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  Future<Either<Failure, PaginatedProductsEntity>> call({
    required String categoryId,
    int page = 1,
    int limit = 10,
  }) async {
    return await repository.getProductsByCategory(
      categoryId,
      page: page,
      limit: limit,
    );
  }
}
