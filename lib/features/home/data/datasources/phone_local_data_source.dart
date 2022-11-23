// ignore_for_file: constant_identifier_names, avoid_print, void_checks

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/home/data/models/phone_model.dart';

abstract class PhonesLocalDataSource {
  Future<List<PhoneHomeStoreModel>> getLastPhonesHomeStoreFromCache();
  Future<List<PhoneBestSellerModel>> getLastPhonesBestSellerFromCache();
  Future<void> phonesHomeStoreToCache(
      List<PhoneHomeStoreModel> phonesHomeStore);
  Future<void> phonesBestSellerToCache(
      List<PhoneBestSellerModel> phonesBestSeller);
}

const CACHED_PHONESHOMESTORE_LIST = 'CACHED_PHONESHOMESTORE_LIST';
const CACHED_PHONESBESTSELLER_LIST = 'CACHED_PHONESBESTSELLER_LIST';

class PhonesLocalDataSourceImpl implements PhonesLocalDataSource {
  final SharedPreferences sharedPreferences;

  PhonesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PhoneHomeStoreModel>> getLastPhonesHomeStoreFromCache() {
    final jsonPhonesHomeStoreList =
        sharedPreferences.getStringList(CACHED_PHONESHOMESTORE_LIST);
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
        sharedPreferences.getStringList(CACHED_PHONESBESTSELLER_LIST);
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
        CACHED_PHONESHOMESTORE_LIST, jsonPhonesHomeStoreList);
    return Future.value(jsonPhonesHomeStoreList);
  }

  @override
  Future<void> phonesBestSellerToCache(
      List<PhoneBestSellerModel> phonesBestSeller) {
    final List<String> jsonPhonesBestSellerList =
        phonesBestSeller.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(
        CACHED_PHONESBESTSELLER_LIST, jsonPhonesBestSellerList);
    return Future.value(jsonPhonesBestSellerList);
  }
}
