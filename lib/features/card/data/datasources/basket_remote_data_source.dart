// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/card/data/models/basket_model.dart';

abstract class BasketRemoteDataSource {
  Future<List<BasketItemsModel>> getBasketItem();
  Future<List<BasketModel>> getBasket();
}

class BasketRemoteDataSourceImpl implements BasketRemoteDataSource {
  final http.Client client;

  BasketRemoteDataSourceImpl({required this.client});

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
