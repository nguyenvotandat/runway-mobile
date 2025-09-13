import 'package:dartz/dartz.dart';
import '../models/models.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/paginated_products_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PaginatedProductsEntity>> getProducts({
    ProductFilter? filter,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final result = await remoteDataSource.getProducts(
        filter: filter,
        page: page,
        limit: limit,
      );
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetail(String id) async {
    try {
      final result = await remoteDataSource.getProductDetail(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
    String query, {
    int limit = 20,
  }) async {
    try {
      final result = await remoteDataSource.searchProducts(query, limit: limit);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts({
    int limit = 10,
  }) async {
    try {
      final result = await remoteDataSource.getFeaturedProducts(limit: limit);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String categoryId, {
    int limit = 10,
  }) async {
    try {
      final result = await remoteDataSource.getProductsByCategory(
        categoryId,
        limit: limit,
      );
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }
}
