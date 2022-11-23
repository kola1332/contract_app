// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/card/domain/entities/basket_entity.dart';

abstract class BasketRepository {
  Future<Either<Failure, List<BasketItemsEntity>>> getBasketItem();
  Future<Either<Failure, List<BasketEntity>>> getBasket();
}
