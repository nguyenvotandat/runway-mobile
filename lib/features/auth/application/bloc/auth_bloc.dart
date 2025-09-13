import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        loginRequested: (email, password) =>
            _onLoginRequested(emit, email, password),
        registerRequested: (email, password, name) =>
            _onRegisterRequested(emit, email, password, name),
        logoutRequested: () => _onLogoutRequested(emit),
      );
    });
  }

  Future<void> _onLoginRequested(
    Emitter<AuthState> emit,
    String email,
    String password,
  ) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(email: email, password: password);

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (authResult) => emit(AuthState.authenticated(authResult.user)),
    );
  }

  Future<void> _onRegisterRequested(
    Emitter<AuthState> emit,
    String email,
    String password,
    String? name,
  ) async {
    emit(const AuthState.loading());

    final result = await registerUseCase(
      email: email,
      password: password,
      name: name,
    );

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (authResult) => emit(AuthState.authenticated(authResult.user)),
    );
  }

  Future<void> _onLogoutRequested(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await logoutUseCase();

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }
}
