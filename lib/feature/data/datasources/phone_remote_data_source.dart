// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/feature/data/models/phone_model.dart';
import 'package:http/http.dart' as http;

abstract class PhoneRemoteDataSource {
  Future<List<PhoneHomeStoreModel>> getPhonesHomeStore();
  Future<List<PhoneBestSellerModel>> getPhonesBestSeller();
}

class PhoneRemoteDataSourceImpl implements PhoneRemoteDataSource {
  final http.Client client;

  PhoneRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PhoneHomeStoreModel>> getPhonesHomeStore() =>
      _getPhoneHomeStoreFromUrl(
          'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

  @override
  Future<List<PhoneBestSellerModel>> getPhonesBestSeller() =>
      _getPhoneBestSellerFromUrl(
          'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');

  Future<List<PhoneHomeStoreModel>> _getPhoneHomeStoreFromUrl(
      String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final phones = json.decode(response.body);
      return (phones['home_store'] as List)
          .map((phone) => PhoneHomeStoreModel.fromJson(phone))
          .toList();
    } else {
      throw ServerException();
    }
  }

  Future<List<PhoneBestSellerModel>> _getPhoneBestSellerFromUrl(
      String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['best_seller'] as List)
          .map((person) => PhoneBestSellerModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
