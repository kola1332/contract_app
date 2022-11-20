// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasketModel _$$_BasketModelFromJson(Map<String, dynamic> json) =>
    _$_BasketModel(
      id: json['id'] as int,
      delivery: json['delivery'] as String,
      total: json['total'] as int,
      basketItems: (json['basketItems'] as List<dynamic>)
          .map((e) => BasketItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BasketModelToJson(_$_BasketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'total': instance.total,
      'basketItems': instance.basketItems,
    };

_$_BasketItemsModel _$$_BasketItemsModelFromJson(Map<String, dynamic> json) =>
    _$_BasketItemsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      images: json['images'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$$_BasketItemsModelToJson(_$_BasketItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'price': instance.price,
    };
