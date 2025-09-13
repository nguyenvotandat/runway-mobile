// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductGetProductsRequested value)?  getProductsRequested,TResult Function( ProductGetProductDetailRequested value)?  getProductDetailRequested,TResult Function( ProductLoadMoreProductsRequested value)?  loadMoreProductsRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductGetProductsRequested() when getProductsRequested != null:
return getProductsRequested(_that);case ProductGetProductDetailRequested() when getProductDetailRequested != null:
return getProductDetailRequested(_that);case ProductLoadMoreProductsRequested() when loadMoreProductsRequested != null:
return loadMoreProductsRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductGetProductsRequested value)  getProductsRequested,required TResult Function( ProductGetProductDetailRequested value)  getProductDetailRequested,required TResult Function( ProductLoadMoreProductsRequested value)  loadMoreProductsRequested,}){
final _that = this;
switch (_that) {
case ProductGetProductsRequested():
return getProductsRequested(_that);case ProductGetProductDetailRequested():
return getProductDetailRequested(_that);case ProductLoadMoreProductsRequested():
return loadMoreProductsRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductGetProductsRequested value)?  getProductsRequested,TResult? Function( ProductGetProductDetailRequested value)?  getProductDetailRequested,TResult? Function( ProductLoadMoreProductsRequested value)?  loadMoreProductsRequested,}){
final _that = this;
switch (_that) {
case ProductGetProductsRequested() when getProductsRequested != null:
return getProductsRequested(_that);case ProductGetProductDetailRequested() when getProductDetailRequested != null:
return getProductDetailRequested(_that);case ProductLoadMoreProductsRequested() when loadMoreProductsRequested != null:
return loadMoreProductsRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProductFilter? filter,  int page,  int limit)?  getProductsRequested,TResult Function( String id)?  getProductDetailRequested,TResult Function( ProductFilter? filter,  int page,  int limit)?  loadMoreProductsRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductGetProductsRequested() when getProductsRequested != null:
return getProductsRequested(_that.filter,_that.page,_that.limit);case ProductGetProductDetailRequested() when getProductDetailRequested != null:
return getProductDetailRequested(_that.id);case ProductLoadMoreProductsRequested() when loadMoreProductsRequested != null:
return loadMoreProductsRequested(_that.filter,_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProductFilter? filter,  int page,  int limit)  getProductsRequested,required TResult Function( String id)  getProductDetailRequested,required TResult Function( ProductFilter? filter,  int page,  int limit)  loadMoreProductsRequested,}) {final _that = this;
switch (_that) {
case ProductGetProductsRequested():
return getProductsRequested(_that.filter,_that.page,_that.limit);case ProductGetProductDetailRequested():
return getProductDetailRequested(_that.id);case ProductLoadMoreProductsRequested():
return loadMoreProductsRequested(_that.filter,_that.page,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProductFilter? filter,  int page,  int limit)?  getProductsRequested,TResult? Function( String id)?  getProductDetailRequested,TResult? Function( ProductFilter? filter,  int page,  int limit)?  loadMoreProductsRequested,}) {final _that = this;
switch (_that) {
case ProductGetProductsRequested() when getProductsRequested != null:
return getProductsRequested(_that.filter,_that.page,_that.limit);case ProductGetProductDetailRequested() when getProductDetailRequested != null:
return getProductDetailRequested(_that.id);case ProductLoadMoreProductsRequested() when loadMoreProductsRequested != null:
return loadMoreProductsRequested(_that.filter,_that.page,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class ProductGetProductsRequested implements ProductEvent {
  const ProductGetProductsRequested({this.filter, this.page = 1, this.limit = 10});
  

 final  ProductFilter? filter;
@JsonKey() final  int page;
@JsonKey() final  int limit;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductGetProductsRequestedCopyWith<ProductGetProductsRequested> get copyWith => _$ProductGetProductsRequestedCopyWithImpl<ProductGetProductsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductGetProductsRequested&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,filter,page,limit);

@override
String toString() {
  return 'ProductEvent.getProductsRequested(filter: $filter, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $ProductGetProductsRequestedCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $ProductGetProductsRequestedCopyWith(ProductGetProductsRequested value, $Res Function(ProductGetProductsRequested) _then) = _$ProductGetProductsRequestedCopyWithImpl;
@useResult
$Res call({
 ProductFilter? filter, int page, int limit
});




}
/// @nodoc
class _$ProductGetProductsRequestedCopyWithImpl<$Res>
    implements $ProductGetProductsRequestedCopyWith<$Res> {
  _$ProductGetProductsRequestedCopyWithImpl(this._self, this._then);

  final ProductGetProductsRequested _self;
  final $Res Function(ProductGetProductsRequested) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = freezed,Object? page = null,Object? limit = null,}) {
  return _then(ProductGetProductsRequested(
filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ProductFilter?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ProductGetProductDetailRequested implements ProductEvent {
  const ProductGetProductDetailRequested(this.id);
  

 final  String id;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductGetProductDetailRequestedCopyWith<ProductGetProductDetailRequested> get copyWith => _$ProductGetProductDetailRequestedCopyWithImpl<ProductGetProductDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductGetProductDetailRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductEvent.getProductDetailRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProductGetProductDetailRequestedCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $ProductGetProductDetailRequestedCopyWith(ProductGetProductDetailRequested value, $Res Function(ProductGetProductDetailRequested) _then) = _$ProductGetProductDetailRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProductGetProductDetailRequestedCopyWithImpl<$Res>
    implements $ProductGetProductDetailRequestedCopyWith<$Res> {
  _$ProductGetProductDetailRequestedCopyWithImpl(this._self, this._then);

  final ProductGetProductDetailRequested _self;
  final $Res Function(ProductGetProductDetailRequested) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProductGetProductDetailRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductLoadMoreProductsRequested implements ProductEvent {
  const ProductLoadMoreProductsRequested({this.filter, required this.page, this.limit = 10});
  

 final  ProductFilter? filter;
 final  int page;
@JsonKey() final  int limit;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductLoadMoreProductsRequestedCopyWith<ProductLoadMoreProductsRequested> get copyWith => _$ProductLoadMoreProductsRequestedCopyWithImpl<ProductLoadMoreProductsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLoadMoreProductsRequested&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,filter,page,limit);

@override
String toString() {
  return 'ProductEvent.loadMoreProductsRequested(filter: $filter, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $ProductLoadMoreProductsRequestedCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $ProductLoadMoreProductsRequestedCopyWith(ProductLoadMoreProductsRequested value, $Res Function(ProductLoadMoreProductsRequested) _then) = _$ProductLoadMoreProductsRequestedCopyWithImpl;
@useResult
$Res call({
 ProductFilter? filter, int page, int limit
});




}
/// @nodoc
class _$ProductLoadMoreProductsRequestedCopyWithImpl<$Res>
    implements $ProductLoadMoreProductsRequestedCopyWith<$Res> {
  _$ProductLoadMoreProductsRequestedCopyWithImpl(this._self, this._then);

  final ProductLoadMoreProductsRequested _self;
  final $Res Function(ProductLoadMoreProductsRequested) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = freezed,Object? page = null,Object? limit = null,}) {
  return _then(ProductLoadMoreProductsRequested(
filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ProductFilter?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductInitial value)?  initial,TResult Function( ProductLoading value)?  loading,TResult Function( ProductLoadingDetail value)?  loadingDetail,TResult Function( ProductLoadingMore value)?  loadingMore,TResult Function( ProductLoaded value)?  loaded,TResult Function( ProductDetailLoaded value)?  detailLoaded,TResult Function( ProductError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductInitial() when initial != null:
return initial(_that);case ProductLoading() when loading != null:
return loading(_that);case ProductLoadingDetail() when loadingDetail != null:
return loadingDetail(_that);case ProductLoadingMore() when loadingMore != null:
return loadingMore(_that);case ProductLoaded() when loaded != null:
return loaded(_that);case ProductDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case ProductError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductInitial value)  initial,required TResult Function( ProductLoading value)  loading,required TResult Function( ProductLoadingDetail value)  loadingDetail,required TResult Function( ProductLoadingMore value)  loadingMore,required TResult Function( ProductLoaded value)  loaded,required TResult Function( ProductDetailLoaded value)  detailLoaded,required TResult Function( ProductError value)  error,}){
final _that = this;
switch (_that) {
case ProductInitial():
return initial(_that);case ProductLoading():
return loading(_that);case ProductLoadingDetail():
return loadingDetail(_that);case ProductLoadingMore():
return loadingMore(_that);case ProductLoaded():
return loaded(_that);case ProductDetailLoaded():
return detailLoaded(_that);case ProductError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductInitial value)?  initial,TResult? Function( ProductLoading value)?  loading,TResult? Function( ProductLoadingDetail value)?  loadingDetail,TResult? Function( ProductLoadingMore value)?  loadingMore,TResult? Function( ProductLoaded value)?  loaded,TResult? Function( ProductDetailLoaded value)?  detailLoaded,TResult? Function( ProductError value)?  error,}){
final _that = this;
switch (_that) {
case ProductInitial() when initial != null:
return initial(_that);case ProductLoading() when loading != null:
return loading(_that);case ProductLoadingDetail() when loadingDetail != null:
return loadingDetail(_that);case ProductLoadingMore() when loadingMore != null:
return loadingMore(_that);case ProductLoaded() when loaded != null:
return loaded(_that);case ProductDetailLoaded() when detailLoaded != null:
return detailLoaded(_that);case ProductError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  loadingDetail,TResult Function( PaginatedProductsEntity paginatedProducts)?  loadingMore,TResult Function( PaginatedProductsEntity paginatedProducts)?  loaded,TResult Function( ProductEntity product)?  detailLoaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductInitial() when initial != null:
return initial();case ProductLoading() when loading != null:
return loading();case ProductLoadingDetail() when loadingDetail != null:
return loadingDetail();case ProductLoadingMore() when loadingMore != null:
return loadingMore(_that.paginatedProducts);case ProductLoaded() when loaded != null:
return loaded(_that.paginatedProducts);case ProductDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.product);case ProductError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  loadingDetail,required TResult Function( PaginatedProductsEntity paginatedProducts)  loadingMore,required TResult Function( PaginatedProductsEntity paginatedProducts)  loaded,required TResult Function( ProductEntity product)  detailLoaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProductInitial():
return initial();case ProductLoading():
return loading();case ProductLoadingDetail():
return loadingDetail();case ProductLoadingMore():
return loadingMore(_that.paginatedProducts);case ProductLoaded():
return loaded(_that.paginatedProducts);case ProductDetailLoaded():
return detailLoaded(_that.product);case ProductError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  loadingDetail,TResult? Function( PaginatedProductsEntity paginatedProducts)?  loadingMore,TResult? Function( PaginatedProductsEntity paginatedProducts)?  loaded,TResult? Function( ProductEntity product)?  detailLoaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProductInitial() when initial != null:
return initial();case ProductLoading() when loading != null:
return loading();case ProductLoadingDetail() when loadingDetail != null:
return loadingDetail();case ProductLoadingMore() when loadingMore != null:
return loadingMore(_that.paginatedProducts);case ProductLoaded() when loaded != null:
return loaded(_that.paginatedProducts);case ProductDetailLoaded() when detailLoaded != null:
return detailLoaded(_that.product);case ProductError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProductInitial implements ProductState {
  const ProductInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.initial()';
}


}




/// @nodoc


class ProductLoading implements ProductState {
  const ProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loading()';
}


}




/// @nodoc


class ProductLoadingDetail implements ProductState {
  const ProductLoadingDetail();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLoadingDetail);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loadingDetail()';
}


}




/// @nodoc


class ProductLoadingMore implements ProductState {
  const ProductLoadingMore(this.paginatedProducts);
  

 final  PaginatedProductsEntity paginatedProducts;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductLoadingMoreCopyWith<ProductLoadingMore> get copyWith => _$ProductLoadingMoreCopyWithImpl<ProductLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLoadingMore&&(identical(other.paginatedProducts, paginatedProducts) || other.paginatedProducts == paginatedProducts));
}


@override
int get hashCode => Object.hash(runtimeType,paginatedProducts);

@override
String toString() {
  return 'ProductState.loadingMore(paginatedProducts: $paginatedProducts)';
}


}

/// @nodoc
abstract mixin class $ProductLoadingMoreCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $ProductLoadingMoreCopyWith(ProductLoadingMore value, $Res Function(ProductLoadingMore) _then) = _$ProductLoadingMoreCopyWithImpl;
@useResult
$Res call({
 PaginatedProductsEntity paginatedProducts
});




}
/// @nodoc
class _$ProductLoadingMoreCopyWithImpl<$Res>
    implements $ProductLoadingMoreCopyWith<$Res> {
  _$ProductLoadingMoreCopyWithImpl(this._self, this._then);

  final ProductLoadingMore _self;
  final $Res Function(ProductLoadingMore) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paginatedProducts = null,}) {
  return _then(ProductLoadingMore(
null == paginatedProducts ? _self.paginatedProducts : paginatedProducts // ignore: cast_nullable_to_non_nullable
as PaginatedProductsEntity,
  ));
}


}

/// @nodoc


class ProductLoaded implements ProductState {
  const ProductLoaded(this.paginatedProducts);
  

 final  PaginatedProductsEntity paginatedProducts;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductLoadedCopyWith<ProductLoaded> get copyWith => _$ProductLoadedCopyWithImpl<ProductLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLoaded&&(identical(other.paginatedProducts, paginatedProducts) || other.paginatedProducts == paginatedProducts));
}


@override
int get hashCode => Object.hash(runtimeType,paginatedProducts);

@override
String toString() {
  return 'ProductState.loaded(paginatedProducts: $paginatedProducts)';
}


}

/// @nodoc
abstract mixin class $ProductLoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $ProductLoadedCopyWith(ProductLoaded value, $Res Function(ProductLoaded) _then) = _$ProductLoadedCopyWithImpl;
@useResult
$Res call({
 PaginatedProductsEntity paginatedProducts
});




}
/// @nodoc
class _$ProductLoadedCopyWithImpl<$Res>
    implements $ProductLoadedCopyWith<$Res> {
  _$ProductLoadedCopyWithImpl(this._self, this._then);

  final ProductLoaded _self;
  final $Res Function(ProductLoaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paginatedProducts = null,}) {
  return _then(ProductLoaded(
null == paginatedProducts ? _self.paginatedProducts : paginatedProducts // ignore: cast_nullable_to_non_nullable
as PaginatedProductsEntity,
  ));
}


}

/// @nodoc


class ProductDetailLoaded implements ProductState {
  const ProductDetailLoaded(this.product);
  

 final  ProductEntity product;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailLoadedCopyWith<ProductDetailLoaded> get copyWith => _$ProductDetailLoadedCopyWithImpl<ProductDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailLoaded&&(identical(other.product, product) || other.product == product));
}


@override
int get hashCode => Object.hash(runtimeType,product);

@override
String toString() {
  return 'ProductState.detailLoaded(product: $product)';
}


}

/// @nodoc
abstract mixin class $ProductDetailLoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $ProductDetailLoadedCopyWith(ProductDetailLoaded value, $Res Function(ProductDetailLoaded) _then) = _$ProductDetailLoadedCopyWithImpl;
@useResult
$Res call({
 ProductEntity product
});




}
/// @nodoc
class _$ProductDetailLoadedCopyWithImpl<$Res>
    implements $ProductDetailLoadedCopyWith<$Res> {
  _$ProductDetailLoadedCopyWithImpl(this._self, this._then);

  final ProductDetailLoaded _self;
  final $Res Function(ProductDetailLoaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? product = null,}) {
  return _then(ProductDetailLoaded(
null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity,
  ));
}


}

/// @nodoc


class ProductError implements ProductState {
  const ProductError(this.message);
  

 final  String message;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductErrorCopyWith<ProductError> get copyWith => _$ProductErrorCopyWithImpl<ProductError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductErrorCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $ProductErrorCopyWith(ProductError value, $Res Function(ProductError) _then) = _$ProductErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductErrorCopyWithImpl<$Res>
    implements $ProductErrorCopyWith<$Res> {
  _$ProductErrorCopyWithImpl(this._self, this._then);

  final ProductError _self;
  final $Res Function(ProductError) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
