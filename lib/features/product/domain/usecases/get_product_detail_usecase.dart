import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductDetailUseCase {
  final ProductRepository repository;

  GetProductDetailUseCase(this.repository);

  Future<Either<Failure, Product>> call(String id) async {
    if (id.isEmpty) {
      return const Left(ValidationFailure('ID sản phẩm không được để trống'));
    }

    return await repository.getProductDetail(id);
  }
}
