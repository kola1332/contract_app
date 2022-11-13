// ignore_for_file: non_constant_identifier_names

import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'phone_model.freezed.dart';
part 'phone_model.g.dart';

@freezed
class PhoneHSModel extends PhoneHSEntity with _$PhoneHSModel {
  const factory PhoneHSModel({
    required int id,
    required String title,
    required String picture,
    required String subtitle,
    required bool is_buy,
    @Default(false) bool is_new,
  }) = _PhoneHSModel;

  factory PhoneHSModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneHSModelFromJson(json);
}

@freezed
class PhoneBSModel extends PhoneBSEntity with _$PhoneBSModel {
  const factory PhoneBSModel(
      {required int id,
      required String title,
      required String picture,
      required bool is_favorites,
      required int price_without_discount,
      required int discount_price}) = _PhoneBSModel;

  factory PhoneBSModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneBSModelFromJson(json);
}
