// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductVariantModel {

 String get id; String get productId; String get colorId; String get sizeId; String get sku; String get status; DateTime get createdAt; DateTime get updatedAt; ProductColorModel? get color; ProductSizeModel? get size; InventoryModel? get inventory; List<PriceModel> get prices;
/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantModelCopyWith<ProductVariantModel> get copyWith => _$ProductVariantModelCopyWithImpl<ProductVariantModel>(this as ProductVariantModel, _$identity);

  /// Serializes this ProductVariantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.sizeId, sizeId) || other.sizeId == sizeId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.inventory, inventory) || other.inventory == inventory)&&const DeepCollectionEquality().equals(other.prices, prices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,colorId,sizeId,sku,status,createdAt,updatedAt,color,size,inventory,const DeepCollectionEquality().hash(prices));

@override
String toString() {
  return 'ProductVariantModel(id: $id, productId: $productId, colorId: $colorId, sizeId: $sizeId, sku: $sku, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, color: $color, size: $size, inventory: $inventory, prices: $prices)';
}


}

/// @nodoc
abstract mixin class $ProductVariantModelCopyWith<$Res>  {
  factory $ProductVariantModelCopyWith(ProductVariantModel value, $Res Function(ProductVariantModel) _then) = _$ProductVariantModelCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String colorId, String sizeId, String sku, String status, DateTime createdAt, DateTime updatedAt, ProductColorModel? color, ProductSizeModel? size, InventoryModel? inventory, List<PriceModel> prices
});


$ProductColorModelCopyWith<$Res>? get color;$ProductSizeModelCopyWith<$Res>? get size;$InventoryModelCopyWith<$Res>? get inventory;

}
/// @nodoc
class _$ProductVariantModelCopyWithImpl<$Res>
    implements $ProductVariantModelCopyWith<$Res> {
  _$ProductVariantModelCopyWithImpl(this._self, this._then);

  final ProductVariantModel _self;
  final $Res Function(ProductVariantModel) _then;

/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? colorId = null,Object? sizeId = null,Object? sku = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? color = freezed,Object? size = freezed,Object? inventory = freezed,Object? prices = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,sizeId: null == sizeId ? _self.sizeId : sizeId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ProductColorModel?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as ProductSizeModel?,inventory: freezed == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as InventoryModel?,prices: null == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as List<PriceModel>,
  ));
}
/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductColorModelCopyWith<$Res>? get color {
    if (_self.color == null) {
    return null;
  }

  return $ProductColorModelCopyWith<$Res>(_self.color!, (value) {
    return _then(_self.copyWith(color: value));
  });
}/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductSizeModelCopyWith<$Res>? get size {
    if (_self.size == null) {
    return null;
  }

  return $ProductSizeModelCopyWith<$Res>(_self.size!, (value) {
    return _then(_self.copyWith(size: value));
  });
}/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InventoryModelCopyWith<$Res>? get inventory {
    if (_self.inventory == null) {
    return null;
  }

  return $InventoryModelCopyWith<$Res>(_self.inventory!, (value) {
    return _then(_self.copyWith(inventory: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductVariantModel].
extension ProductVariantModelPatterns on ProductVariantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariantModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariantModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  String colorId,  String sizeId,  String sku,  String status,  DateTime createdAt,  DateTime updatedAt,  ProductColorModel? color,  ProductSizeModel? size,  InventoryModel? inventory,  List<PriceModel> prices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
return $default(_that.id,_that.productId,_that.colorId,_that.sizeId,_that.sku,_that.status,_that.createdAt,_that.updatedAt,_that.color,_that.size,_that.inventory,_that.prices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  String colorId,  String sizeId,  String sku,  String status,  DateTime createdAt,  DateTime updatedAt,  ProductColorModel? color,  ProductSizeModel? size,  InventoryModel? inventory,  List<PriceModel> prices)  $default,) {final _that = this;
switch (_that) {
case _ProductVariantModel():
return $default(_that.id,_that.productId,_that.colorId,_that.sizeId,_that.sku,_that.status,_that.createdAt,_that.updatedAt,_that.color,_that.size,_that.inventory,_that.prices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  String colorId,  String sizeId,  String sku,  String status,  DateTime createdAt,  DateTime updatedAt,  ProductColorModel? color,  ProductSizeModel? size,  InventoryModel? inventory,  List<PriceModel> prices)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariantModel() when $default != null:
return $default(_that.id,_that.productId,_that.colorId,_that.sizeId,_that.sku,_that.status,_that.createdAt,_that.updatedAt,_that.color,_that.size,_that.inventory,_that.prices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductVariantModel implements ProductVariantModel {
  const _ProductVariantModel({required this.id, required this.productId, required this.colorId, required this.sizeId, required this.sku, required this.status, required this.createdAt, required this.updatedAt, this.color, this.size, this.inventory, final  List<PriceModel> prices = const []}): _prices = prices;
  factory _ProductVariantModel.fromJson(Map<String, dynamic> json) => _$ProductVariantModelFromJson(json);

@override final  String id;
@override final  String productId;
@override final  String colorId;
@override final  String sizeId;
@override final  String sku;
@override final  String status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  ProductColorModel? color;
@override final  ProductSizeModel? size;
@override final  InventoryModel? inventory;
 final  List<PriceModel> _prices;
@override@JsonKey() List<PriceModel> get prices {
  if (_prices is EqualUnmodifiableListView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prices);
}


/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantModelCopyWith<_ProductVariantModel> get copyWith => __$ProductVariantModelCopyWithImpl<_ProductVariantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductVariantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.colorId, colorId) || other.colorId == colorId)&&(identical(other.sizeId, sizeId) || other.sizeId == sizeId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.inventory, inventory) || other.inventory == inventory)&&const DeepCollectionEquality().equals(other._prices, _prices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,colorId,sizeId,sku,status,createdAt,updatedAt,color,size,inventory,const DeepCollectionEquality().hash(_prices));

@override
String toString() {
  return 'ProductVariantModel(id: $id, productId: $productId, colorId: $colorId, sizeId: $sizeId, sku: $sku, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, color: $color, size: $size, inventory: $inventory, prices: $prices)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantModelCopyWith<$Res> implements $ProductVariantModelCopyWith<$Res> {
  factory _$ProductVariantModelCopyWith(_ProductVariantModel value, $Res Function(_ProductVariantModel) _then) = __$ProductVariantModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String colorId, String sizeId, String sku, String status, DateTime createdAt, DateTime updatedAt, ProductColorModel? color, ProductSizeModel? size, InventoryModel? inventory, List<PriceModel> prices
});


@override $ProductColorModelCopyWith<$Res>? get color;@override $ProductSizeModelCopyWith<$Res>? get size;@override $InventoryModelCopyWith<$Res>? get inventory;

}
/// @nodoc
class __$ProductVariantModelCopyWithImpl<$Res>
    implements _$ProductVariantModelCopyWith<$Res> {
  __$ProductVariantModelCopyWithImpl(this._self, this._then);

  final _ProductVariantModel _self;
  final $Res Function(_ProductVariantModel) _then;

/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? colorId = null,Object? sizeId = null,Object? sku = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? color = freezed,Object? size = freezed,Object? inventory = freezed,Object? prices = null,}) {
  return _then(_ProductVariantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,colorId: null == colorId ? _self.colorId : colorId // ignore: cast_nullable_to_non_nullable
as String,sizeId: null == sizeId ? _self.sizeId : sizeId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ProductColorModel?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as ProductSizeModel?,inventory: freezed == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as InventoryModel?,prices: null == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as List<PriceModel>,
  ));
}

/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductColorModelCopyWith<$Res>? get color {
    if (_self.color == null) {
    return null;
  }

  return $ProductColorModelCopyWith<$Res>(_self.color!, (value) {
    return _then(_self.copyWith(color: value));
  });
}/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductSizeModelCopyWith<$Res>? get size {
    if (_self.size == null) {
    return null;
  }

  return $ProductSizeModelCopyWith<$Res>(_self.size!, (value) {
    return _then(_self.copyWith(size: value));
  });
}/// Create a copy of ProductVariantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InventoryModelCopyWith<$Res>? get inventory {
    if (_self.inventory == null) {
    return null;
  }

  return $InventoryModelCopyWith<$Res>(_self.inventory!, (value) {
    return _then(_self.copyWith(inventory: value));
  });
}
}

// dart format on
