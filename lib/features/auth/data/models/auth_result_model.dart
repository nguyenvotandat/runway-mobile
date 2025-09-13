import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
import '../../domain/entities/auth_result.dart';

part 'auth_result_model.freezed.dart';
part 'auth_result_model.g.dart';

@freezed
abstract class AuthResultModel with _$AuthResultModel {
  const factory AuthResultModel({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
  }) = _AuthResultModel;

  factory AuthResultModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResultModelFromJson(json);
}

extension AuthResultModelMapper on AuthResultModel {
  AuthResult toEntity() {
    return AuthResult(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user.toEntity(),
    );
  }
}

extension AuthResultMapper on AuthResult {
  AuthResultModel toModel() {
    return AuthResultModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user.toModel(),
    );
  }
}
