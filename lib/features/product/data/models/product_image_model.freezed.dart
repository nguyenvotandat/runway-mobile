// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductImageModel {

 String get id; String get url; int get sortOrder;
/// Create a copy of ProductImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductImageModelCopyWith<ProductImageModel> get copyWith => _$ProductImageModelCopyWithImpl<ProductImageModel>(this as ProductImageModel, _$identity);

  /// Serializes this ProductImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,sortOrder);

@override
String toString() {
  return 'ProductImageModel(id: $id, url: $url, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $ProductImageModelCopyWith<$Res>  {
  factory $ProductImageModelCopyWith(ProductImageModel value, $Res Function(ProductImageModel) _then) = _$ProductImageModelCopyWithImpl;
@useResult
$Res call({
 String id, String url, int sortOrder
});




}
/// @nodoc
class _$ProductImageModelCopyWithImpl<$Res>
    implements $ProductImageModelCopyWith<$Res> {
  _$ProductImageModelCopyWithImpl(this._self, this._then);

  final ProductImageModel _self;
  final $Res Function(ProductImageModel) _then;

/// Create a copy of ProductImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductImageModel].
extension ProductImageModelPatterns on ProductImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductImageModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductImageModel() when $default != null:
return $default(_that.id,_that.url,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _ProductImageModel():
return $default(_that.id,_that.url,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _ProductImageModel() when $default != null:
return $default(_that.id,_that.url,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductImageModel implements ProductImageModel {
  const _ProductImageModel({required this.id, required this.url, this.sortOrder = 0});
  factory _ProductImageModel.fromJson(Map<String, dynamic> json) => _$ProductImageModelFromJson(json);

@override final  String id;
@override final  String url;
@override@JsonKey() final  int sortOrder;

/// Create a copy of ProductImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductImageModelCopyWith<_ProductImageModel> get copyWith => __$ProductImageModelCopyWithImpl<_ProductImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,sortOrder);

@override
String toString() {
  return 'ProductImageModel(id: $id, url: $url, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$ProductImageModelCopyWith<$Res> implements $ProductImageModelCopyWith<$Res> {
  factory _$ProductImageModelCopyWith(_ProductImageModel value, $Res Function(_ProductImageModel) _then) = __$ProductImageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, int sortOrder
});




}
/// @nodoc
class __$ProductImageModelCopyWithImpl<$Res>
    implements _$ProductImageModelCopyWith<$Res> {
  __$ProductImageModelCopyWithImpl(this._self, this._then);

  final _ProductImageModel _self;
  final $Res Function(_ProductImageModel) _then;

/// Create a copy of ProductImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? sortOrder = null,}) {
  return _then(_ProductImageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
