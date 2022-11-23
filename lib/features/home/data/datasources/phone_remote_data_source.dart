// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/home/data/models/phone_model.dart';

abstract class PhoneRemoteDataSource {
  Future<List<PhoneHomeStoreModel>> getPhonesHomeStore();
  Future<List<PhoneBestSellerModel>> getPhonesBestSellers();
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
  Future<List<PhoneBestSellerModel>> getPhonesBestSellers() async {
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
}
