// ignore_for_file: constant_identifier_names, avoid_print, void_checks

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/detail/data/models/phone_detail_model.dart';

abstract class DetailLocalDataSource {
  Future<List<PhoneDetailModel>> getLastPhonesDetailFromCache();
  Future<void> phonesDetailToCache(List<PhoneDetailModel> phonesDetail);
}

const CACHED_PHONESDETAIL_LIST = 'CACHED_PHONESDETAIL_LIST';

class DetailLocalDataSourceImpl implements DetailLocalDataSource {
  final SharedPreferences sharedPreferences;

  DetailLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PhoneDetailModel>> getLastPhonesDetailFromCache() {
    final jsonPhonesDetailList =
        sharedPreferences.getStringList(CACHED_PHONESDETAIL_LIST);
    if (jsonPhonesDetailList != null) {
      return Future.value(jsonPhonesDetailList
          .map((phonesDetail) =>
              PhoneDetailModel.fromJson(json.decode(phonesDetail)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> phonesDetailToCache(List<PhoneDetailModel> phonesDetail) {
    final List<String> jsonPhonesDetailList =
        phonesDetail.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(
        CACHED_PHONESDETAIL_LIST, jsonPhonesDetailList);
    return Future.value(jsonPhonesDetailList);
  }
}
