// ignore_for_file: constant_identifier_names, avoid_print, void_checks

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/card/data/models/basket_model.dart';

abstract class BasketLocalDataSource {
  Future<List<BasketItemsModel>> getLastBasketItemFromCache();
  Future<List<BasketModel>> getLastBasketFromCache();
  Future<void> basketItemToCache(List<BasketItemsModel> basketItems);
  Future<void> basketToCache(List<BasketModel> baskets);
}

const CACHED_BASKETITEMS_LIST = 'CACHED_BASKETITEMS_LIST';
const CACHED_BASKET_LIST = 'CACHED_BASKET_LIST';

class BasketLocalDataSourceImpl implements BasketLocalDataSource {
  final SharedPreferences sharedPreferences;

  BasketLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<BasketItemsModel>> getLastBasketItemFromCache() {
    final jsonBasketItemList =
        sharedPreferences.getStringList(CACHED_BASKETITEMS_LIST);
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
