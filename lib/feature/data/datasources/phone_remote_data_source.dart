// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/feature/data/models/basket_model.dart';
import 'package:contract_app/feature/data/models/phone_detail_model.dart';
import 'package:contract_app/feature/data/models/phone_model.dart';
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
      final phones = json.decode(response.body);
      return (phones['home_store'] as List)
          .map((phone) => PhoneHomeStoreModel.fromJson(phone))
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
      final phones = json.decode(response.body);
      return (phones['best_seller'] as List)
          .map((phone) => PhoneBestSellerModel.fromJson(phone))
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
      final phones = json.decode(response.body);
      return (phones[''] as List)
          .map((phone) => PhoneDetailModel.fromJson(phone))
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
      final phones = json.decode(response.body);
      return (phones[''] as List)
          .map((phone) => BasketItemsModel.fromJson(phone))
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
      final phones = json.decode(response.body);
      return (phones[''] as List)
          .map((phone) => BasketModel.fromJson(phone))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
