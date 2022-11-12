// ignore_for_file: constant_identifier_names, avoid_print, void_checks

import 'dart:convert';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/feature/data/models/phone_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PhonesLocalDataSource {
  Future<List<PhoneHSModel>> getLastPhonesHSFromCache();
  Future<List<PhoneBSModel>> getLastPhonesBSFromCache();
  Future<void> phonesHSToCache(List<PhoneHSModel> phonesHS);
  Future<void> phonesBSToCache(List<PhoneBSModel> phonesBS);
}

const CACHED_PHONESHS_LIST = 'CACHED_PHONESHS_LIST';
const CACHED_PHONESBS_LIST = 'CACHED_PHONESBS_LIST';

class PhonesLocalDataSourceImpl implements PhonesLocalDataSource {
  final SharedPreferences sharedPreferences;

  PhonesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PhoneHSModel>> getLastPhonesHSFromCache() {
    final jsonPhonesHSList =
        sharedPreferences.getStringList(CACHED_PHONESHS_LIST);
    if (jsonPhonesHSList != null) {
      return Future.value(jsonPhonesHSList
          .map((phoneHS) => PhoneHSModel.fromJson(json.decode(phoneHS)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<PhoneBSModel>> getLastPhonesBSFromCache() {
    final jsonPhonesBSList =
        sharedPreferences.getStringList(CACHED_PHONESHS_LIST);
    if (jsonPhonesBSList != null) {
      return Future.value(jsonPhonesBSList
          .map((phoneBS) => PhoneBSModel.fromJson(json.decode(phoneBS)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> phonesHSToCache(List<PhoneHSModel> phonesBS) {
    final List<String> jsonPhonesHSList =
        phonesBS.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(CACHED_PHONESHS_LIST, jsonPhonesHSList);
    print('PhonesHS to write cashe: ${jsonPhonesHSList.length}');
    return Future.value(jsonPhonesHSList);
  }

  @override
  Future<void> phonesBSToCache(List<PhoneBSModel> phonesBS) {
    final List<String> jsonPhonesBSList =
        phonesBS.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(CACHED_PHONESBS_LIST, jsonPhonesBSList);
    print('PhonesBS to write cashe: ${jsonPhonesBSList.length}');
    return Future.value(jsonPhonesBSList);
  }
}
