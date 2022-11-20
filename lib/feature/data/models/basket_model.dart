import 'package:contract_app/feature/domain/entities/basket_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'basket_model.freezed.dart';
part 'basket_model.g.dart';

@freezed
class BasketModel extends BasketEntity with _$BasketModel {
  const factory BasketModel(
    List<BasketItemsModel> basket, {
    required String id,
    required String delivery,
    required int total,
  }) = _BasketModel;

  factory BasketModel.fromJson(Map<String, dynamic> json) =>
      _$BasketModelFromJson(json);
}

@freezed
class BasketItemsModel extends BasketItemsEntity with _$BasketItemsModel {
  const factory BasketItemsModel({
    required int id,
    required String title,
    required String images,
    required int price,
  }) = _BasketItemsModel;

  factory BasketItemsModel.fromJson(Map<String, dynamic> json) =>
      _$BasketItemsModelFromJson(json);
}
