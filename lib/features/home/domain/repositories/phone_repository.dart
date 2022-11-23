// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import 'package:contract_app/features/home/data/models/phone_model.dart';
import 'package:contract_app/core/error/failure.dart';

abstract class PhoneRepository {
  Future<Either<Failure, List<PhoneHomeStoreModel>>> getPhonesHomeStore();
  Future<Either<Failure, List<PhoneBestSellerModel>>> getPhonesBestSeller();
}
