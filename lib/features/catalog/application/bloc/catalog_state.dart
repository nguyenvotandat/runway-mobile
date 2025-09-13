part of 'catalog_bloc.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState.initial() = CatalogInitial;
  const factory CatalogState.loading() = CatalogLoading;
  const factory CatalogState.loaded(List<CategoryEntity> categories) = CatalogLoaded;
  const factory CatalogState.error(String message) = CatalogError;
}
