// ignore_for_file: constant_identifier_names, avoid_print, void_checks

import 'dart:convert';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/feature/data/models/phone_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PhonesLocalDataSource {
  Future<List<PhoneHomeStoreModel>> getLastPhonesHomeStoreFromCache();
  Future<List<PhoneBestSellerModel>> getLastPhonesBestSellerFromCache();
  Future<void> phonesHomeStoreToCache(
      List<PhoneHomeStoreModel> phonesHomeStore);
  Future<void> phonesBestSellerToCache(
      List<PhoneBestSellerModel> phonesBestSeller);
}

const CACHED_PHONESHomeStore_LIST = 'CACHED_PHONESHomeStore_LIST';
const CACHED_PHONESBestSeller_LIST = 'CACHED_PHONESBestSeller_LIST';

class PhonesLocalDataSourceImpl implements PhonesLocalDataSource {
  final SharedPreferences sharedPreferences;

  PhonesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PhoneHomeStoreModel>> getLastPhonesHomeStoreFromCache() {
    final jsonPhonesHomeStoreList =
        sharedPreferences.getStringList(CACHED_PHONESHomeStore_LIST);
    if (jsonPhonesHomeStoreList != null) {
      return Future.value(jsonPhonesHomeStoreList
          .map((phoneHomeStore) =>
              PhoneHomeStoreModel.fromJson(json.decode(phoneHomeStore)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<PhoneBestSellerModel>> getLastPhonesBestSellerFromCache() {
    final jsonPhonesBestSellerList =
        sharedPreferences.getStringList(CACHED_PHONESHomeStore_LIST);
    if (jsonPhonesBestSellerList != null) {
      return Future.value(jsonPhonesBestSellerList
          .map((phoneBestSeller) =>
              PhoneBestSellerModel.fromJson(json.decode(phoneBestSeller)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> phonesHomeStoreToCache(
      List<PhoneHomeStoreModel> phonesBestSeller) {
    final List<String> jsonPhonesHomeStoreList =
        phonesBestSeller.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(
        CACHED_PHONESHomeStore_LIST, jsonPhonesHomeStoreList);
    print('PhonesHomeStore to write cashe: ${jsonPhonesHomeStoreList.length}');
    return Future.value(jsonPhonesHomeStoreList);
  }

  @override
  Future<void> phonesBestSellerToCache(
      List<PhoneBestSellerModel> phonesBestSeller) {
    final List<String> jsonPhonesBestSellerList =
        phonesBestSeller.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(
        CACHED_PHONESBestSeller_LIST, jsonPhonesBestSellerList);
    print(
        'PhonesBestSeller to write cashe: ${jsonPhonesBestSellerList.length}');
    return Future.value(jsonPhonesBestSellerList);
  }
}
