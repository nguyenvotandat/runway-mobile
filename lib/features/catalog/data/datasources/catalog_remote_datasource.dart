import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../models/category_model.dart';

abstract class CatalogRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final Dio dio;

  CatalogRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(ApiEndpoints.categories);

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          response.data['message'] ?? 'Không thể lấy danh sách danh mục',
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
          e.response?.data['message'] ?? 'Không thể lấy danh sách danh mục',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }
}
