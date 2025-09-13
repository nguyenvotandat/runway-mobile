// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_products_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedProductsModel {

 List<ProductModel> get data; int get total; int get page; int get limit; int get totalPages; bool get hasNext; bool get hasPrev;
/// Create a copy of PaginatedProductsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedProductsModelCopyWith<PaginatedProductsModel> get copyWith => _$PaginatedProductsModelCopyWithImpl<PaginatedProductsModel>(this as PaginatedProductsModel, _$identity);

  /// Serializes this PaginatedProductsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedProductsModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total,page,limit,totalPages,hasNext,hasPrev);

@override
String toString() {
  return 'PaginatedProductsModel(data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class $PaginatedProductsModelCopyWith<$Res>  {
  factory $PaginatedProductsModelCopyWith(PaginatedProductsModel value, $Res Function(PaginatedProductsModel) _then) = _$PaginatedProductsModelCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> data, int total, int page, int limit, int totalPages, bool hasNext, bool hasPrev
});




}
/// @nodoc
class _$PaginatedProductsModelCopyWithImpl<$Res>
    implements $PaginatedProductsModelCopyWith<$Res> {
  _$PaginatedProductsModelCopyWithImpl(this._self, this._then);

  final PaginatedProductsModel _self;
  final $Res Function(PaginatedProductsModel) _then;

/// Create a copy of PaginatedProductsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,Object? hasNext = null,Object? hasPrev = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrev: null == hasPrev ? _self.hasPrev : hasPrev // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedProductsModel].
extension PaginatedProductsModelPatterns on PaginatedProductsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedProductsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedProductsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedProductsModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedProductsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedProductsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedProductsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductModel> data,  int total,  int page,  int limit,  int totalPages,  bool hasNext,  bool hasPrev)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedProductsModel() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit,_that.totalPages,_that.hasNext,_that.hasPrev);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductModel> data,  int total,  int page,  int limit,  int totalPages,  bool hasNext,  bool hasPrev)  $default,) {final _that = this;
switch (_that) {
case _PaginatedProductsModel():
return $default(_that.data,_that.total,_that.page,_that.limit,_that.totalPages,_that.hasNext,_that.hasPrev);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductModel> data,  int total,  int page,  int limit,  int totalPages,  bool hasNext,  bool hasPrev)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedProductsModel() when $default != null:
return $default(_that.data,_that.total,_that.page,_that.limit,_that.totalPages,_that.hasNext,_that.hasPrev);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedProductsModel implements PaginatedProductsModel {
  const _PaginatedProductsModel({required final  List<ProductModel> data, required this.total, required this.page, required this.limit, required this.totalPages, this.hasNext = false, this.hasPrev = false}): _data = data;
  factory _PaginatedProductsModel.fromJson(Map<String, dynamic> json) => _$PaginatedProductsModelFromJson(json);

 final  List<ProductModel> _data;
@override List<ProductModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int total;
@override final  int page;
@override final  int limit;
@override final  int totalPages;
@override@JsonKey() final  bool hasNext;
@override@JsonKey() final  bool hasPrev;

/// Create a copy of PaginatedProductsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedProductsModelCopyWith<_PaginatedProductsModel> get copyWith => __$PaginatedProductsModelCopyWithImpl<_PaginatedProductsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedProductsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedProductsModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrev, hasPrev) || other.hasPrev == hasPrev));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total,page,limit,totalPages,hasNext,hasPrev);

@override
String toString() {
  return 'PaginatedProductsModel(data: $data, total: $total, page: $page, limit: $limit, totalPages: $totalPages, hasNext: $hasNext, hasPrev: $hasPrev)';
}


}

/// @nodoc
abstract mixin class _$PaginatedProductsModelCopyWith<$Res> implements $PaginatedProductsModelCopyWith<$Res> {
  factory _$PaginatedProductsModelCopyWith(_PaginatedProductsModel value, $Res Function(_PaginatedProductsModel) _then) = __$PaginatedProductsModelCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> data, int total, int page, int limit, int totalPages, bool hasNext, bool hasPrev
});




}
/// @nodoc
class __$PaginatedProductsModelCopyWithImpl<$Res>
    implements _$PaginatedProductsModelCopyWith<$Res> {
  __$PaginatedProductsModelCopyWithImpl(this._self, this._then);

  final _PaginatedProductsModel _self;
  final $Res Function(_PaginatedProductsModel) _then;

/// Create a copy of PaginatedProductsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,Object? page = null,Object? limit = null,Object? totalPages = null,Object? hasNext = null,Object? hasPrev = null,}) {
  return _then(_PaginatedProductsModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrev: null == hasPrev ? _self.hasPrev : hasPrev // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
