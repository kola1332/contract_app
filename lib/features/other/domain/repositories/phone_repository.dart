// ignore_for_file: file_names

import 'package:contract_app/features/other/domain/entities/basket_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:contract_app/features/other/domain/entities/phone_detail_entity.dart';
import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/home/domain/entities/phone_entity.dart';

abstract class PhoneRepository {
  Future<Either<Failure, List<PhoneHomeStoreEntity>>> getPhonesHomeStore();
  Future<Either<Failure, List<PhoneBestSellerEntity>>> getPhonesBestSeller();
  Future<Either<Failure, List<PhoneDetailEntity>>> getPhonesDetail();
  Future<Either<Failure, List<BasketItemsEntity>>> getBasketItem();
  Future<Either<Failure, List<BasketEntity>>> getBasket();
}
