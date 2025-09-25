import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';

/// Base class cho tất cả Blocs với error handling tập trung
abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(super.initialState);

  /// Handle errors và emit appropriate state
  Future<void> handleOperation<T>(
    Emitter<State> emit,
    Future<T> Function() operation,
    State Function(T result) onSuccess,
    State Function(String message) onError,
  ) async {
    try {
      final result = await operation();
      emit(onSuccess(result));
    } on ArgumentError catch (e) {
      // Technical validation errors từ Params
      emit(onError('Dữ liệu không hợp lệ: ${e.message}'));
    } on FormatException catch (e) {
      // Parse errors
      emit(onError('Định dạng dữ liệu sai: ${e.message}'));
    } catch (e) {
      // Unexpected errors
      emit(onError('Đã xảy ra lỗi không xác định'));
    }
  }

  /// Handle Either result từ UseCase
  Future<void> handleEitherResult<T>(
    Emitter<State> emit,
    Future<Either<Failure, T>> Function() operation,
    State Function(T result) onSuccess,
    State Function(String message) onError,
  ) async {
    try {
      final result = await operation();
      result.fold(
        (failure) => emit(onError(mapFailureToMessage(failure))),
        (success) => emit(onSuccess(success)),
      );
    } on ArgumentError catch (e) {
      emit(onError('Dữ liệu không hợp lệ: ${e.message}'));
    } on FormatException catch (e) {
      emit(onError('Định dạng dữ liệu sai: ${e.message}'));
    } catch (e) {
      emit(onError('Đã xảy ra lỗi không xác định'));
    }
  }

  /// Map Failure thành user-friendly message
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ValidationFailure:
        return failure.message;
      case NetworkFailure:
        return 'Không có kết nối mạng. Vui lòng thử lại.';
      case ServerFailure:
        return 'Lỗi máy chủ. Vui lòng thử lại sau.';
      case AuthFailure:
        return 'Bạn không có quyền thực hiện thao tác này.';
      case CacheFailure:
        return 'Lỗi lưu trữ dữ liệu cục bộ.';
      default:
        return 'Đã xảy ra lỗi. Vui lòng thử lại.';
    }
  }
}
