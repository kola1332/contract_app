// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneDetailModel _$$_PhoneDetailModelFromJson(Map<String, dynamic> json) =>
    _$_PhoneDetailModel(
      CPU: json['CPU'] as String,
      camera: json['camera'] as String,
      capacity:
          (json['capacity'] as List<dynamic>).map((e) => e as String).toList(),
      color: (json['color'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      isFavorites: json['isFavorites'] as bool,
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      sd: json['sd'] as String,
      ssd: json['ssd'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_PhoneDetailModelToJson(_$_PhoneDetailModel instance) =>
    <String, dynamic>{
      'CPU': instance.CPU,
      'camera': instance.camera,
      'capacity': instance.capacity,
      'color': instance.color,
      'id': instance.id,
      'images': instance.images,
      'isFavorites': instance.isFavorites,
      'price': instance.price,
      'rating': instance.rating,
      'sd': instance.sd,
      'ssd': instance.ssd,
      'title': instance.title,
    };
