import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetFeaturedProductsUseCase {
  final ProductRepository repository;

  GetFeaturedProductsUseCase(this.repository);

  Future<Either<Failure, List<Product>>> call({int limit = 10}) async {
    if (limit <= 0) {
      return const Left(ValidationFailure('Số lượng sản phẩm phải lớn hơn 0'));
    }

    if (limit > 50) {
      return const Left(
        ValidationFailure('Số lượng sản phẩm không được vượt quá 50'),
      );
    }

    return await repository.getFeaturedProducts(limit: limit);
  }
}
