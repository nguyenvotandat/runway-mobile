import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../models/auth_result_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResultModel> login({
    required String email,
    required String password,
  });

  Future<AuthResultModel> register({
    required String email,
    required String password,
    String? name,
  });

  Future<void> logout(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthResultModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return AuthResultModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          response.data['message'] ?? 'Đăng nhập thất bại',
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
      } else if (e.response?.statusCode == 401) {
        throw const AuthException('Email hoặc mật khẩu không đúng');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Đăng nhập thất bại',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }

  @override
  Future<AuthResultModel> register({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: {
          'email': email,
          'password': password,
          if (name != null) 'name': name,
        },
      );

      if (response.statusCode == 201) {
        return AuthResultModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          response.data['message'] ?? 'Đăng ký thất bại',
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
      } else if (e.response?.statusCode == 409) {
        throw const AuthException('Email đã được sử dụng');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Đăng ký thất bại',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }

  @override
  Future<void> logout(String token) async {
    try {
      await dio.post(
        ApiEndpoints.logout,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const NetworkException('Kết nối mạng không ổn định');
      } else if (e.type == DioExceptionType.connectionError) {
        throw const NetworkException('Không thể kết nối đến máy chủ');
      } else {
        throw ServerException(
          e.response?.data['message'] ?? 'Đăng xuất thất bại',
          e.response?.statusCode,
        );
      }
    } catch (e) {
      throw ServerException('Có lỗi xảy ra: $e');
    }
  }
}
