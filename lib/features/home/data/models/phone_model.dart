// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:contract_app/features/home/domain/entities/phone_entity.dart';

part 'phone_model.freezed.dart';
part 'phone_model.g.dart';

class PhoneModel {
  List<PhoneHomeStoreModel>? homeStore;
  List<PhoneBestSellerModel>? bestSeller;

  PhoneModel({required this.homeStore, required this.bestSeller});

  PhoneModel.fromJson(Map<String, dynamic> json) {
    if (json['home_store'] != null) {
      homeStore = <PhoneHomeStoreModel>[];
      json['home_store'].forEach((v) {
        homeStore!.add(PhoneHomeStoreModel.fromJson(v));
      });
    }
    if (json['best_seller'] != null) {
      bestSeller = <PhoneBestSellerModel>[];
      json['best_seller'].forEach((v) {
        bestSeller!.add(PhoneBestSellerModel.fromJson(v));
      });
    }
  }
}

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
