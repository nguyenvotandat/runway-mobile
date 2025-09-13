// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CatalogEvent()';
}


}

/// @nodoc
class $CatalogEventCopyWith<$Res>  {
$CatalogEventCopyWith(CatalogEvent _, $Res Function(CatalogEvent) __);
}


/// Adds pattern-matching-related methods to [CatalogEvent].
extension CatalogEventPatterns on CatalogEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CatalogGetCategoriesRequested value)?  getCategoriesRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CatalogGetCategoriesRequested() when getCategoriesRequested != null:
return getCategoriesRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CatalogGetCategoriesRequested value)  getCategoriesRequested,}){
final _that = this;
switch (_that) {
case CatalogGetCategoriesRequested():
return getCategoriesRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CatalogGetCategoriesRequested value)?  getCategoriesRequested,}){
final _that = this;
switch (_that) {
case CatalogGetCategoriesRequested() when getCategoriesRequested != null:
return getCategoriesRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getCategoriesRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CatalogGetCategoriesRequested() when getCategoriesRequested != null:
return getCategoriesRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getCategoriesRequested,}) {final _that = this;
switch (_that) {
case CatalogGetCategoriesRequested():
return getCategoriesRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getCategoriesRequested,}) {final _that = this;
switch (_that) {
case CatalogGetCategoriesRequested() when getCategoriesRequested != null:
return getCategoriesRequested();case _:
  return null;

}
}

}

/// @nodoc


class CatalogGetCategoriesRequested implements CatalogEvent {
  const CatalogGetCategoriesRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogGetCategoriesRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CatalogEvent.getCategoriesRequested()';
}


}




/// @nodoc
mixin _$CatalogState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CatalogState()';
}


}

/// @nodoc
class $CatalogStateCopyWith<$Res>  {
$CatalogStateCopyWith(CatalogState _, $Res Function(CatalogState) __);
}


/// Adds pattern-matching-related methods to [CatalogState].
extension CatalogStatePatterns on CatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CatalogInitial value)?  initial,TResult Function( CatalogLoading value)?  loading,TResult Function( CatalogLoaded value)?  loaded,TResult Function( CatalogError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CatalogInitial() when initial != null:
return initial(_that);case CatalogLoading() when loading != null:
return loading(_that);case CatalogLoaded() when loaded != null:
return loaded(_that);case CatalogError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CatalogInitial value)  initial,required TResult Function( CatalogLoading value)  loading,required TResult Function( CatalogLoaded value)  loaded,required TResult Function( CatalogError value)  error,}){
final _that = this;
switch (_that) {
case CatalogInitial():
return initial(_that);case CatalogLoading():
return loading(_that);case CatalogLoaded():
return loaded(_that);case CatalogError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CatalogInitial value)?  initial,TResult? Function( CatalogLoading value)?  loading,TResult? Function( CatalogLoaded value)?  loaded,TResult? Function( CatalogError value)?  error,}){
final _that = this;
switch (_that) {
case CatalogInitial() when initial != null:
return initial(_that);case CatalogLoading() when loading != null:
return loading(_that);case CatalogLoaded() when loaded != null:
return loaded(_that);case CatalogError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CategoryEntity> categories)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CatalogInitial() when initial != null:
return initial();case CatalogLoading() when loading != null:
return loading();case CatalogLoaded() when loaded != null:
return loaded(_that.categories);case CatalogError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CategoryEntity> categories)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CatalogInitial():
return initial();case CatalogLoading():
return loading();case CatalogLoaded():
return loaded(_that.categories);case CatalogError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CategoryEntity> categories)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CatalogInitial() when initial != null:
return initial();case CatalogLoading() when loading != null:
return loading();case CatalogLoaded() when loaded != null:
return loaded(_that.categories);case CatalogError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CatalogInitial implements CatalogState {
  const CatalogInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CatalogState.initial()';
}


}




/// @nodoc


class CatalogLoading implements CatalogState {
  const CatalogLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CatalogState.loading()';
}


}




/// @nodoc


class CatalogLoaded implements CatalogState {
  const CatalogLoaded(final  List<CategoryEntity> categories): _categories = categories;
  

 final  List<CategoryEntity> _categories;
 List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLoadedCopyWith<CatalogLoaded> get copyWith => _$CatalogLoadedCopyWithImpl<CatalogLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLoaded&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CatalogState.loaded(categories: $categories)';
}


}

/// @nodoc
abstract mixin class $CatalogLoadedCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory $CatalogLoadedCopyWith(CatalogLoaded value, $Res Function(CatalogLoaded) _then) = _$CatalogLoadedCopyWithImpl;
@useResult
$Res call({
 List<CategoryEntity> categories
});




}
/// @nodoc
class _$CatalogLoadedCopyWithImpl<$Res>
    implements $CatalogLoadedCopyWith<$Res> {
  _$CatalogLoadedCopyWithImpl(this._self, this._then);

  final CatalogLoaded _self;
  final $Res Function(CatalogLoaded) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(CatalogLoaded(
null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,
  ));
}


}

/// @nodoc


class CatalogError implements CatalogState {
  const CatalogError(this.message);
  

 final  String message;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogErrorCopyWith<CatalogError> get copyWith => _$CatalogErrorCopyWithImpl<CatalogError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CatalogState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CatalogErrorCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory $CatalogErrorCopyWith(CatalogError value, $Res Function(CatalogError) _then) = _$CatalogErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CatalogErrorCopyWithImpl<$Res>
    implements $CatalogErrorCopyWith<$Res> {
  _$CatalogErrorCopyWithImpl(this._self, this._then);

  final CatalogError _self;
  final $Res Function(CatalogError) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CatalogError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
