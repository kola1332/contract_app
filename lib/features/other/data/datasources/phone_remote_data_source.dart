// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/home/data/models/phone_model.dart';
import 'package:contract_app/features/other/data/models/basket_model.dart';
import 'package:contract_app/features/other/data/models/phone_detail_model.dart';
import 'package:http/http.dart' as http;

abstract class PhoneRemoteDataSource {
  Future<List<PhoneHomeStoreModel>> getPhonesHomeStore();
  Future<List<PhoneBestSellerModel>> getPhonesBestSeller();
  Future<List<PhoneDetailModel>> getPhonesDetail();
  Future<List<BasketItemsModel>> getBasketItem();
  Future<List<BasketModel>> getBasket();
}

class PhoneRemoteDataSourceImpl implements PhoneRemoteDataSource {
  final http.Client client;

  PhoneRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PhoneHomeStoreModel>> getPhonesHomeStore() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final phonesHomeStore = json.decode(response.body);
      return (phonesHomeStore['home_store'] as List)
          .map((phoneHomeStore) => PhoneHomeStoreModel.fromJson(phoneHomeStore))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PhoneBestSellerModel>> getPhonesBestSeller() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final phonesBestSeller = json.decode(response.body);
      return (phonesBestSeller['best_seller'] as List)
          .map((phoneBestSeller) =>
              PhoneBestSellerModel.fromJson(phoneBestSeller))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PhoneDetailModel>> getPhonesDetail() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final phonesDetail = json.decode(response.body);
      final m = {
        'test': [phonesDetail]
      };
      return (m['test'] as List)
          .map((phoneDetail) => PhoneDetailModel.fromJson(phoneDetail))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<BasketModel>> getBasket() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final baskets = json.decode(response.body);
      final m1 = {
        'test': [baskets]
      };
      return (m1['test'] as List)
          .map((basket) => BasketModel.fromJson(basket))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<BasketItemsModel>> getBasketItem() async {
    final response = await client.get(
        Uri.parse(
            'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final basketItems = json.decode(response.body);
      return (basketItems['basket'] as List)
          .map((basketItem) => BasketItemsModel.fromJson(basketItem))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
