part of 'catalog_bloc.dart';

@freezed
class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent.getCategoriesRequested() =
      CatalogGetCategoriesRequested;
}
