import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/category_entity.dart';

abstract class CatalogRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
