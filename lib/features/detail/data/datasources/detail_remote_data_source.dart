// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/features/detail/data/models/phone_detail_model.dart';

abstract class DetailRemoteDataSource {
  Future<List<PhoneDetailModel>> getPhonesDetail();
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final http.Client client;

  DetailRemoteDataSourceImpl({required this.client});

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
}
