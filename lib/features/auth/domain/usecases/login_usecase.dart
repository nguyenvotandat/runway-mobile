import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/auth_result.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, AuthResult>> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      return const Left(ValidationFailure('Email không được để trống'));
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return const Left(ValidationFailure('Email không hợp lệ'));
    }

    if (password.isEmpty) {
      return const Left(ValidationFailure('Mật khẩu không được để trống'));
    }

    if (password.length < 6) {
      return const Left(ValidationFailure('Mật khẩu phải có ít nhất 6 ký tự'));
    }

    return await repository.login(email: email, password: password);
  }
}
