// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneDetailModel _$$_PhoneDetailModelFromJson(Map<String, dynamic> json) =>
    _$_PhoneDetailModel(
      id: json['id'] as int,
      title: json['title'] as String,
      camera: json['camera'] as String,
      capacity:
          (json['capacity'] as List<dynamic>).map((e) => e as String).toList(),
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      CPU: json['CPU'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      isFavorites: json['isFavorites'] as bool,
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      sd: json['sd'] as String,
      ssd: json['ssd'] as String,
    );

Map<String, dynamic> _$$_PhoneDetailModelToJson(_$_PhoneDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'camera': instance.camera,
      'capacity': instance.capacity,
      'color': instance.color,
      'CPU': instance.CPU,
      'images': instance.images,
      'isFavorites': instance.isFavorites,
      'price': instance.price,
      'rating': instance.rating,
      'sd': instance.sd,
      'ssd': instance.ssd,
    };
