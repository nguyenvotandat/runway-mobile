part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = AuthLoginRequested;

  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    String? name,
  }) = AuthRegisterRequested;

  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
}
