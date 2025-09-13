import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';

part 'catalog_bloc.freezed.dart';
part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CatalogBloc(this.getCategoriesUseCase) : super(const CatalogState.initial()) {
    on<CatalogEvent>((event, emit) async {
      await event.when(
        getCategoriesRequested: () => _onGetCategoriesRequested(emit),
      );
    });
  }

  Future<void> _onGetCategoriesRequested(Emitter<CatalogState> emit) async {
    emit(const CatalogState.loading());

    final result = await getCategoriesUseCase();

    result.fold(
      (failure) => emit(CatalogState.error(failure.message)),
      (categories) => emit(CatalogState.loaded(categories)),
    );
  }
}
