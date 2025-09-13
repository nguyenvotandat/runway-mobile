part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(User user) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error(String message) = AuthError;
}
