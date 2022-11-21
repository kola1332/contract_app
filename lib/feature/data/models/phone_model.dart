// ignore_for_file: non_constant_identifier_names

import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'phone_model.freezed.dart';
part 'phone_model.g.dart';

@freezed
class PhoneHomeStoreModel extends PhoneHomeStoreEntity
    with _$PhoneHomeStoreModel {
  const factory PhoneHomeStoreModel({
    required int id,
    required String title,
    required String picture,
    required String subtitle,
    required bool is_buy,
    @Default(false) bool is_new,
  }) = _PhoneHomeStoreModel;

  factory PhoneHomeStoreModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneHomeStoreModelFromJson(json);
}

@freezed
class PhoneBestSellerModel extends PhoneBestSellerEntity
    with _$PhoneBestSellerModel {
  const factory PhoneBestSellerModel(
      {required int id,
      required String title,
      required String picture,
      required bool is_favorites,
      required int price_without_discount,
      required int discount_price}) = _PhoneBestSellerModel;

  factory PhoneBestSellerModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneBestSellerModelFromJson(json);
}
