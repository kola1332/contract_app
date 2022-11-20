// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'basket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasketModel _$BasketModelFromJson(Map<String, dynamic> json) {
  return _BasketModel.fromJson(json);
}

/// @nodoc
mixin _$BasketModel {
  int get id => throw _privateConstructorUsedError;
  String get delivery => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<BasketItemsModel> get basketItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasketModelCopyWith<BasketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketModelCopyWith<$Res> {
  factory $BasketModelCopyWith(
          BasketModel value, $Res Function(BasketModel) then) =
      _$BasketModelCopyWithImpl<$Res, BasketModel>;
  @useResult
  $Res call(
      {int id, String delivery, int total, List<BasketItemsModel> basketItems});
}

/// @nodoc
class _$BasketModelCopyWithImpl<$Res, $Val extends BasketModel>
    implements $BasketModelCopyWith<$Res> {
  _$BasketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivery = null,
    Object? total = null,
    Object? basketItems = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      basketItems: null == basketItems
          ? _value.basketItems
          : basketItems // ignore: cast_nullable_to_non_nullable
              as List<BasketItemsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasketModelCopyWith<$Res>
    implements $BasketModelCopyWith<$Res> {
  factory _$$_BasketModelCopyWith(
          _$_BasketModel value, $Res Function(_$_BasketModel) then) =
      __$$_BasketModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String delivery, int total, List<BasketItemsModel> basketItems});
}

/// @nodoc
class __$$_BasketModelCopyWithImpl<$Res>
    extends _$BasketModelCopyWithImpl<$Res, _$_BasketModel>
    implements _$$_BasketModelCopyWith<$Res> {
  __$$_BasketModelCopyWithImpl(
      _$_BasketModel _value, $Res Function(_$_BasketModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivery = null,
    Object? total = null,
    Object? basketItems = null,
  }) {
    return _then(_$_BasketModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      basketItems: null == basketItems
          ? _value._basketItems
          : basketItems // ignore: cast_nullable_to_non_nullable
              as List<BasketItemsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasketModel with DiagnosticableTreeMixin implements _BasketModel {
  const _$_BasketModel(
      {required this.id,
      required this.delivery,
      required this.total,
      required final List<BasketItemsModel> basketItems})
      : _basketItems = basketItems;

  factory _$_BasketModel.fromJson(Map<String, dynamic> json) =>
      _$$_BasketModelFromJson(json);

  @override
  final int id;
  @override
  final String delivery;
  @override
  final int total;
  final List<BasketItemsModel> _basketItems;
  @override
  List<BasketItemsModel> get basketItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basketItems);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasketModel(id: $id, delivery: $delivery, total: $total, basketItems: $basketItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BasketModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('delivery', delivery))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('basketItems', basketItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasketModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._basketItems, _basketItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, delivery, total,
      const DeepCollectionEquality().hash(_basketItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasketModelCopyWith<_$_BasketModel> get copyWith =>
      __$$_BasketModelCopyWithImpl<_$_BasketModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasketModelToJson(
      this,
    );
  }
}

abstract class _BasketModel implements BasketModel {
  const factory _BasketModel(
      {required final int id,
      required final String delivery,
      required final int total,
      required final List<BasketItemsModel> basketItems}) = _$_BasketModel;

  factory _BasketModel.fromJson(Map<String, dynamic> json) =
      _$_BasketModel.fromJson;

  @override
  int get id;
  @override
  String get delivery;
  @override
  int get total;
  @override
  List<BasketItemsModel> get basketItems;
  @override
  @JsonKey(ignore: true)
  _$$_BasketModelCopyWith<_$_BasketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BasketItemsModel _$BasketItemsModelFromJson(Map<String, dynamic> json) {
  return _BasketItemsModel.fromJson(json);
}

/// @nodoc
mixin _$BasketItemsModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get images => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasketItemsModelCopyWith<BasketItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketItemsModelCopyWith<$Res> {
  factory $BasketItemsModelCopyWith(
          BasketItemsModel value, $Res Function(BasketItemsModel) then) =
      _$BasketItemsModelCopyWithImpl<$Res, BasketItemsModel>;
  @useResult
  $Res call({int id, String title, String images, int price});
}

/// @nodoc
class _$BasketItemsModelCopyWithImpl<$Res, $Val extends BasketItemsModel>
    implements $BasketItemsModelCopyWith<$Res> {
  _$BasketItemsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? images = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasketItemsModelCopyWith<$Res>
    implements $BasketItemsModelCopyWith<$Res> {
  factory _$$_BasketItemsModelCopyWith(
          _$_BasketItemsModel value, $Res Function(_$_BasketItemsModel) then) =
      __$$_BasketItemsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String images, int price});
}

/// @nodoc
class __$$_BasketItemsModelCopyWithImpl<$Res>
    extends _$BasketItemsModelCopyWithImpl<$Res, _$_BasketItemsModel>
    implements _$$_BasketItemsModelCopyWith<$Res> {
  __$$_BasketItemsModelCopyWithImpl(
      _$_BasketItemsModel _value, $Res Function(_$_BasketItemsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? images = null,
    Object? price = null,
  }) {
    return _then(_$_BasketItemsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasketItemsModel
    with DiagnosticableTreeMixin
    implements _BasketItemsModel {
  const _$_BasketItemsModel(
      {required this.id,
      required this.title,
      required this.images,
      required this.price});

  factory _$_BasketItemsModel.fromJson(Map<String, dynamic> json) =>
      _$$_BasketItemsModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String images;
  @override
  final int price;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasketItemsModel(id: $id, title: $title, images: $images, price: $price)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BasketItemsModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('price', price));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasketItemsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, images, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasketItemsModelCopyWith<_$_BasketItemsModel> get copyWith =>
      __$$_BasketItemsModelCopyWithImpl<_$_BasketItemsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasketItemsModelToJson(
      this,
    );
  }
}

abstract class _BasketItemsModel implements BasketItemsModel {
  const factory _BasketItemsModel(
      {required final int id,
      required final String title,
      required final String images,
      required final int price}) = _$_BasketItemsModel;

  factory _BasketItemsModel.fromJson(Map<String, dynamic> json) =
      _$_BasketItemsModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get images;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_BasketItemsModelCopyWith<_$_BasketItemsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
