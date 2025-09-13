// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PriceModel {

 String get id; String get variantId; String get amount; String get currency; DateTime? get validFrom;
/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceModelCopyWith<PriceModel> get copyWith => _$PriceModelCopyWithImpl<PriceModel>(this as PriceModel, _$identity);

  /// Serializes this PriceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,variantId,amount,currency,validFrom);

@override
String toString() {
  return 'PriceModel(id: $id, variantId: $variantId, amount: $amount, currency: $currency, validFrom: $validFrom)';
}


}

/// @nodoc
abstract mixin class $PriceModelCopyWith<$Res>  {
  factory $PriceModelCopyWith(PriceModel value, $Res Function(PriceModel) _then) = _$PriceModelCopyWithImpl;
@useResult
$Res call({
 String id, String variantId, String amount, String currency, DateTime? validFrom
});




}
/// @nodoc
class _$PriceModelCopyWithImpl<$Res>
    implements $PriceModelCopyWith<$Res> {
  _$PriceModelCopyWithImpl(this._self, this._then);

  final PriceModel _self;
  final $Res Function(PriceModel) _then;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? variantId = null,Object? amount = null,Object? currency = null,Object? validFrom = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,validFrom: freezed == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceModel].
extension PriceModelPatterns on PriceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceModel value)  $default,){
final _that = this;
switch (_that) {
case _PriceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceModel value)?  $default,){
final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String variantId,  String amount,  String currency,  DateTime? validFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that.id,_that.variantId,_that.amount,_that.currency,_that.validFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String variantId,  String amount,  String currency,  DateTime? validFrom)  $default,) {final _that = this;
switch (_that) {
case _PriceModel():
return $default(_that.id,_that.variantId,_that.amount,_that.currency,_that.validFrom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String variantId,  String amount,  String currency,  DateTime? validFrom)?  $default,) {final _that = this;
switch (_that) {
case _PriceModel() when $default != null:
return $default(_that.id,_that.variantId,_that.amount,_that.currency,_that.validFrom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceModel implements PriceModel {
  const _PriceModel({required this.id, required this.variantId, required this.amount, this.currency = 'VND', this.validFrom});
  factory _PriceModel.fromJson(Map<String, dynamic> json) => _$PriceModelFromJson(json);

@override final  String id;
@override final  String variantId;
@override final  String amount;
@override@JsonKey() final  String currency;
@override final  DateTime? validFrom;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceModelCopyWith<_PriceModel> get copyWith => __$PriceModelCopyWithImpl<_PriceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,variantId,amount,currency,validFrom);

@override
String toString() {
  return 'PriceModel(id: $id, variantId: $variantId, amount: $amount, currency: $currency, validFrom: $validFrom)';
}


}

/// @nodoc
abstract mixin class _$PriceModelCopyWith<$Res> implements $PriceModelCopyWith<$Res> {
  factory _$PriceModelCopyWith(_PriceModel value, $Res Function(_PriceModel) _then) = __$PriceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String variantId, String amount, String currency, DateTime? validFrom
});




}
/// @nodoc
class __$PriceModelCopyWithImpl<$Res>
    implements _$PriceModelCopyWith<$Res> {
  __$PriceModelCopyWithImpl(this._self, this._then);

  final _PriceModel _self;
  final $Res Function(_PriceModel) _then;

/// Create a copy of PriceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? variantId = null,Object? amount = null,Object? currency = null,Object? validFrom = freezed,}) {
  return _then(_PriceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,validFrom: freezed == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
