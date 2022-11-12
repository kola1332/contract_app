// ignore_for_file: non_constant_identifier_names

import 'package:contract_app/feature/domain/entities/phone_entity.dart';

class PhoneHSModel extends PhoneHSEntity {
  const PhoneHSModel(
      {required super.id,
      required super.title,
      required super.picture,
      required super.subtitle,
      required super.is_buy,
      super.is_new});

  factory PhoneHSModel.fromJson(Map<String, dynamic> json) {
    return PhoneHSModel(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      is_buy: json['is_buy'],
      subtitle: json['subtitle'],
      is_new: json['is_new'] == ['true'] ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'is_buy': is_buy,
      'subtitle': subtitle,
      'is_new': is_new,
    };
  }
}

class PhoneBSModel extends PhoneBSEntity {
  const PhoneBSModel(
      {required super.id,
      required super.title,
      required super.picture,
      required super.is_favorites,
      required super.price_without_discount,
      required super.discount_price});

  factory PhoneBSModel.fromJson(Map<String, dynamic> json) {
    return PhoneBSModel(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      is_favorites: json['is_favorites'],
      price_without_discount: json['price_without_discount'],
      discount_price: json['discount_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'is_favorites': is_favorites,
      'price_without_discount': price_without_discount,
      'discount_price': discount_price,
    };
  }
}
