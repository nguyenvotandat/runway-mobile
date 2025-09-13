import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(
    String categoryId, {
    int limit = 10,
  }) async {
    if (categoryId.isEmpty) {
      return const Left(ValidationFailure('ID danh mục không được để trống'));
    }

    if (limit <= 0) {
      return const Left(ValidationFailure('Số lượng sản phẩm phải lớn hơn 0'));
    }

    if (limit > 50) {
      return const Left(
        ValidationFailure('Số lượng sản phẩm không được vượt quá 50'),
      );
    }

    return await repository.getProductsByCategory(categoryId, limit: limit);
  }
}
