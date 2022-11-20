// ignore_for_file: non_constant_identifier_names

import 'package:contract_app/feature/domain/entities/phone_detail_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'phone_detail_model.freezed.dart';
part 'phone_detail_model.g.dart';

@freezed
class PhoneDetailModel extends PhoneDetailEntity with _$PhoneDetailModel {
  const factory PhoneDetailModel({
    required int id,
    required String title,
    required String camera,
    required List<String> capacity,
    required List<String> color,
    required String CPU,
    required List<String> images,
    required bool isFavorites,
    required int price,
    required double rating,
    required String sd,
    required String ssd,
  }) = _PhoneDetailModel;

  factory PhoneDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneDetailModelFromJson(json);
}
