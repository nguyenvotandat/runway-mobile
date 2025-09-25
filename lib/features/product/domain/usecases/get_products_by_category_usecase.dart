import 'package:dartz/dartz.dart';
import 'package:runway_mobile/features/product/data/models/get_products_by_category_pasrams.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';


class GetProductsByCategoryUseCase
    implements UseCase<List<ProductEntity>, GetProductsByCategoryParams> {
  final ProductRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
    GetProductsByCategoryParams params,
  ) async {
    // ✅ Business validation thay vì technical validation
    try {
      return await repository.getProductsByCategory(
        params.categoryId,
        limit: params.limit,
      );
    } catch (e) {
      // Handle repository exceptions
      return Left(ServerFailure(e.toString()));
    }
  }
}
