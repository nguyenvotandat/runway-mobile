import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/models.dart';

abstract class ProductRemoteDataSource {
  Future<PaginatedProductsModel> getProducts({
    ProductFilter? filter,
    int page = 1,
    int limit = 10,
  });

  Future<ProductModel> getProductDetail(String id);

  Future<List<ProductModel>> searchProducts(String query, {int limit = 20});

  Future<List<ProductModel>> getFeaturedProducts({int limit = 10});

  Future<List<ProductModel>> getProductsByCategory(
    String categoryId, {
    int limit = 10,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<PaginatedProductsModel> getProducts({
    ProductFilter? filter,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final queryParams = <String, dynamic>{'page': page, 'limit': limit};

      if (filter != null) {
        if (filter.categoryId != null) {
          queryParams['categoryId'] = filter.categoryId;
        }
        if (filter.brandId != null) {
          queryParams['brandId'] = filter.brandId;
        }
        if (filter.minPrice != null) {
          queryParams['minPrice'] = filter.minPrice;
        }
        if (filter.maxPrice != null) {
          queryParams['maxPrice'] = filter.maxPrice;
        }
        if (filter.search != null) {
          queryParams['search'] = filter.search;
        }
        if (filter.colorId != null) {
          queryParams['colorId'] = filter.colorId;
        }
        if (filter.sizeId != null) {
          queryParams['sizeId'] = filter.sizeId;
        }
        if (filter.inStock != null) {
          queryParams['inStock'] = filter.inStock;
        }
      }

      final response = await dio.get(
        ApiEndpoints.products,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        // Backend trả về { success: true, data: { data: [...], total: ..., ... } }
        return PaginatedProductsModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          response.data['message'] ?? 'Không thể lấy danh sách sản phẩm',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Kết nối mạng không ổn định');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('Không thể kết nối đến máy chủ');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Không thể lấy danh sách sản phẩm',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }

  @override
  Future<ProductModel> getProductDetail(String id) async {
    try {
      final response = await dio.get('${ApiEndpoints.productDetail}/$id');

      if (response.statusCode == 200 && response.data['success'] == true) {
        // Backend trả về { success: true, data: {...} }
        return ProductModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          response.data['message'] ?? 'Không thể lấy thông tin sản phẩm',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Kết nối mạng không ổn định');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('Không thể kết nối đến máy chủ');
      } else if (e.response?.statusCode == 404) {
        throw const ServerException('Không tìm thấy sản phẩm');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Không thể lấy thông tin sản phẩm',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(
    String query, {
    int limit = 20,
  }) async {
    try {
      final response = await dio.get(
        '${ApiEndpoints.products}/search',
        queryParameters: {'query': query, 'limit': limit},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> productsData = response.data['data'];
        return productsData.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          response.data['message'] ?? 'Không thể tìm kiếm sản phẩm',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Kết nối mạng không ổn định');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('Không thể kết nối đến máy chủ');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Không thể tìm kiếm sản phẩm',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }

  @override
  Future<List<ProductModel>> getFeaturedProducts({int limit = 10}) async {
    try {
      final response = await dio.get(
        '${ApiEndpoints.products}/featured',
        queryParameters: {'limit': limit},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> productsData = response.data['data'];
        return productsData.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          response.data['message'] ?? 'Không thể lấy sản phẩm nổi bật',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Kết nối mạng không ổn định');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('Không thể kết nối đến máy chủ');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Không thể lấy sản phẩm nổi bật',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(
    String categoryId, {
    int limit = 10,
  }) async {
    try {
      final response = await dio.get(
        '${ApiEndpoints.products}/category/$categoryId',
        queryParameters: {'limit': limit},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<dynamic> productsData = response.data['data'];
        return productsData.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          response.data['message'] ?? 'Không thể lấy sản phẩm theo danh mục',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Kết nối mạng không ổn định');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('Không thể kết nối đến máy chủ');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Không thể lấy sản phẩm theo danh mục',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }
}
