import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:runway_mobile/features/auth/data/models/auth_result_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.secureStorage);

  @override
  Future<Either<Failure, AuthResult>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
        email: email,
        password: password,
      );

      // Store tokens and user data
      await Future.wait([
        secureStorage.write(
          key: AppConstants.accessTokenKey,
          value: result.accessToken,
        ),
        secureStorage.write(
          key: AppConstants.refreshTokenKey,
          value: result.refreshToken,
        ),
        secureStorage.write(
          key: AppConstants.userDataKey,
          value: jsonEncode(result.user.toJson()),
        ),
      ]);

      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> register({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final result = await remoteDataSource.register(
        email: email,
        password: password,
        name: name,
      );

      // Store tokens and user data
      await Future.wait([
        secureStorage.write(
          key: AppConstants.accessTokenKey,
          value: result.accessToken,
        ),
        secureStorage.write(
          key: AppConstants.refreshTokenKey,
          value: result.refreshToken,
        ),
        secureStorage.write(
          key: AppConstants.userDataKey,
          value: jsonEncode(result.user.toJson()),
        ),
      ]);

      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final token = await secureStorage.read(key: AppConstants.accessTokenKey);

      if (token != null) {
        await remoteDataSource.logout(token);
      }

      // Clear local storage
      await Future.wait([
        secureStorage.delete(key: AppConstants.accessTokenKey),
        secureStorage.delete(key: AppConstants.refreshTokenKey),
        secureStorage.delete(key: AppConstants.userDataKey),
      ]);

      return const Right(null);
    } on ServerException catch (e) {
      // Still clear local storage even if server logout fails
      await Future.wait([
        secureStorage.delete(key: AppConstants.accessTokenKey),
        secureStorage.delete(key: AppConstants.refreshTokenKey),
        secureStorage.delete(key: AppConstants.userDataKey),
      ]);
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      // Still clear local storage even if network fails
      await Future.wait([
        secureStorage.delete(key: AppConstants.accessTokenKey),
        secureStorage.delete(key: AppConstants.refreshTokenKey),
        secureStorage.delete(key: AppConstants.userDataKey),
      ]);
      return Left(NetworkFailure(e.message));
    } catch (e) {
      await Future.wait([
        secureStorage.delete(key: AppConstants.accessTokenKey),
        secureStorage.delete(key: AppConstants.refreshTokenKey),
        secureStorage.delete(key: AppConstants.userDataKey),
      ]);
      return Left(UnknownFailure('Có lỗi xảy ra: $e'));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final userData = await secureStorage.read(key: AppConstants.userDataKey);

      if (userData == null) {
        return const Right(null);
      }

      final userJson = jsonDecode(userData) as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userJson);

      return Right(userModel.toEntity());
    } catch (e) {
      return Left(CacheFailure('Không thể lấy thông tin người dùng: $e'));
    }
  }

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      final token = await secureStorage.read(key: AppConstants.accessTokenKey);
      return Right(token);
    } catch (e) {
      return Left(CacheFailure('Không thể lấy access token: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final token = await secureStorage.read(key: AppConstants.accessTokenKey);
      return Right(token != null && token.isNotEmpty);
    } catch (e) {
      return Left(CacheFailure('Không thể kiểm tra trạng thái đăng nhập: $e'));
    }
  }
}
