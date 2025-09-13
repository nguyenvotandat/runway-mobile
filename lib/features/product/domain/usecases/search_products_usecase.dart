import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class SearchProductsUseCase {
  final ProductRepository repository;

  SearchProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(
    String query, {
    int limit = 20,
  }) async {
    if (query.isEmpty) {
      return const Left(
        ValidationFailure('Từ khóa tìm kiếm không được để trống'),
      );
    }

    if (query.trim().length < 2) {
      return const Left(
        ValidationFailure('Từ khóa tìm kiếm phải có ít nhất 2 ký tự'),
      );
    }

    return await repository.searchProducts(query.trim(), limit: limit);
  }
}
