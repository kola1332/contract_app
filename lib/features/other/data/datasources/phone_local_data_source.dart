// ignore_for_file: constant_identifier_names, avoid_print, void_checks

import 'dart:convert';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/other/data/models/basket_model.dart';
import 'package:contract_app/features/other/data/models/phone_detail_model.dart';
import 'package:contract_app/features/other/data/models/phone_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PhonesLocalDataSource {
  Future<List<PhoneHomeStoreModel>> getLastPhonesHomeStoreFromCache();
  Future<List<PhoneBestSellerModel>> getLastPhonesBestSellerFromCache();
  Future<List<PhoneDetailModel>> getLastPhonesDetailFromCache();
  Future<List<BasketItemsModel>> getLastBasketItemFromCache();
  Future<List<BasketModel>> getLastBasketFromCache();
  Future<void> phonesHomeStoreToCache(
      List<PhoneHomeStoreModel> phonesHomeStore);
  Future<void> phonesBestSellerToCache(
      List<PhoneBestSellerModel> phonesBestSeller);
  Future<void> phonesDetailToCache(List<PhoneDetailModel> phonesDetail);
  Future<void> basketItemToCache(List<BasketItemsModel> basketItems);
  Future<void> basketToCache(List<BasketModel> baskets);
}

const CACHED_PHONESHOMESTORE_LIST = 'CACHED_PHONESHOMESTORE_LIST';
const CACHED_PHONESBESTSELLER_LIST = 'CACHED_PHONESBESTSELLER_LIST';
const CACHED_PHONESDETAIL_LIST = 'CACHED_PHONESDETAIL_LIST';
const CACHED_BASKETITEMS_LIST = 'CACHED_BASKETITEMS_LIST';
const CACHED_BASKET_LIST = 'CACHED_BASKET_LIST';

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
  Future<List<BasketItemsModel>> getLastBasketItemFromCache() {
    final jsonBasketItemList =
        sharedPreferences.getStringList(CACHED_PHONESDETAIL_LIST);
    if (jsonBasketItemList != null) {
      return Future.value(jsonBasketItemList
          .map((basketItem) =>
              BasketItemsModel.fromJson(json.decode(basketItem)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<BasketModel>> getLastBasketFromCache() {
    final jsonBasketList = sharedPreferences.getStringList(CACHED_BASKET_LIST);
    if (jsonBasketList != null) {
      return Future.value(jsonBasketList
          .map((basket) => BasketModel.fromJson(json.decode(basket)))
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

  @override
  Future<void> phonesDetailToCache(List<PhoneDetailModel> phonesDetail) {
    final List<String> jsonPhonesDetailList =
        phonesDetail.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(
        CACHED_PHONESDETAIL_LIST, jsonPhonesDetailList);
    return Future.value(jsonPhonesDetailList);
  }

  @override
  Future<void> basketItemToCache(List<BasketItemsModel> basketItems) {
    final List<String> jsonBasketItemsList =
        basketItems.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(
        CACHED_BASKETITEMS_LIST, jsonBasketItemsList);
    return Future.value(jsonBasketItemsList);
  }

  @override
  Future<void> basketToCache(List<BasketModel> baskets) {
    final List<String> jsonBasketsList =
        baskets.map((phone) => json.encode(phone.toJson())).toList();

    sharedPreferences.setStringList(CACHED_BASKET_LIST, jsonBasketsList);
    return Future.value(jsonBasketsList);
  }
}
