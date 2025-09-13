// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_size_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductSizeModel {

 String get id; String get label;
/// Create a copy of ProductSizeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSizeModelCopyWith<ProductSizeModel> get copyWith => _$ProductSizeModelCopyWithImpl<ProductSizeModel>(this as ProductSizeModel, _$identity);

  /// Serializes this ProductSizeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSizeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'ProductSizeModel(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class $ProductSizeModelCopyWith<$Res>  {
  factory $ProductSizeModelCopyWith(ProductSizeModel value, $Res Function(ProductSizeModel) _then) = _$ProductSizeModelCopyWithImpl;
@useResult
$Res call({
 String id, String label
});




}
/// @nodoc
class _$ProductSizeModelCopyWithImpl<$Res>
    implements $ProductSizeModelCopyWith<$Res> {
  _$ProductSizeModelCopyWithImpl(this._self, this._then);

  final ProductSizeModel _self;
  final $Res Function(ProductSizeModel) _then;

/// Create a copy of ProductSizeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSizeModel].
extension ProductSizeModelPatterns on ProductSizeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSizeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSizeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSizeModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductSizeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSizeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSizeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSizeModel() when $default != null:
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label)  $default,) {final _that = this;
switch (_that) {
case _ProductSizeModel():
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label)?  $default,) {final _that = this;
switch (_that) {
case _ProductSizeModel() when $default != null:
return $default(_that.id,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSizeModel implements ProductSizeModel {
  const _ProductSizeModel({required this.id, required this.label});
  factory _ProductSizeModel.fromJson(Map<String, dynamic> json) => _$ProductSizeModelFromJson(json);

@override final  String id;
@override final  String label;

/// Create a copy of ProductSizeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSizeModelCopyWith<_ProductSizeModel> get copyWith => __$ProductSizeModelCopyWithImpl<_ProductSizeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSizeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSizeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'ProductSizeModel(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class _$ProductSizeModelCopyWith<$Res> implements $ProductSizeModelCopyWith<$Res> {
  factory _$ProductSizeModelCopyWith(_ProductSizeModel value, $Res Function(_ProductSizeModel) _then) = __$ProductSizeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String label
});




}
/// @nodoc
class __$ProductSizeModelCopyWithImpl<$Res>
    implements _$ProductSizeModelCopyWith<$Res> {
  __$ProductSizeModelCopyWithImpl(this._self, this._then);

  final _ProductSizeModel _self;
  final $Res Function(_ProductSizeModel) _then;

/// Create a copy of ProductSizeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,}) {
  return _then(_ProductSizeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
