import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? name,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelMapper on UserModel {
  User toEntity() {
    return User(id: id, email: email, name: name, createdAt: createdAt);
  }
}

extension UserMapper on User {
  UserModel toModel() {
    return UserModel(id: id, email: email, name: name, createdAt: createdAt);
  }
}
