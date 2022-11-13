// ignore_for_file: non_constant_identifier_names, file_names

import 'package:equatable/equatable.dart';

class PhoneEntity {
  final int id;
  final String title;
  final String picture;

  const PhoneEntity({
    required this.id,
    required this.title,
    required this.picture,
  });
}

class PhoneHSEntity extends PhoneEntity {
  final String subtitle;
  final bool is_buy;
  final bool is_new;

  const PhoneHSEntity({
    required super.id,
    required super.title,
    required super.picture,
    required this.subtitle,
    required this.is_buy,
    this.is_new = false,
  });
}

class PhoneBSEntity extends PhoneEntity {
  final bool is_favorites;
  final int price_without_discount;
  final int discount_price;

  const PhoneBSEntity({
    required super.id,
    required super.title,
    required super.picture,
    required this.is_favorites,
    required this.price_without_discount,
    required this.discount_price,
  });
}
