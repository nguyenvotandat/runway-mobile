import '../../../../core/usecase/usecase.dart';
import '../entities/paginated_products_entity.dart';
import '../repositories/product_repository.dart';

// Params class cho GetProductsUseCase
class GetProductsParams {
  final ProductFilter? filter;
  final int page;
  final int limit;

  const GetProductsParams({this.filter, this.page = 1, this.limit = 10});

  // Factory constructor với validation
  factory GetProductsParams.create({
    ProductFilter? filter,
    int? page,
    int? limit,
  }) {
    final validPage = page ?? 1;
    final validLimit = limit ?? 10;

    // ✅ Validation logic
    if (validPage < 1) {
      throw ArgumentError('Page phải lớn hơn 0');
    }
    if (validLimit < 1 || validLimit > 100) {
      throw ArgumentError('Limit phải từ 1 đến 100');
    }

    return GetProductsParams(
      filter: filter,
      page: validPage,
      limit: validLimit,
    );
  }
}

class GetProductsUseCase
    implements UseCase<PaginatedProductsEntity, GetProductsParams> {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<PaginatedProductsEntity> call({GetProductsParams? params}) async {
    final validParams = params ?? const GetProductsParams();

    final result = await repository.getProducts(
      filter: validParams.filter,
      page: validParams.page,
      limit: validParams.limit,
    );

    // Handle Either result từ repository - throw Failure để Bloc catch
    return result.fold((failure) => throw failure, (success) => success);
  }
}
