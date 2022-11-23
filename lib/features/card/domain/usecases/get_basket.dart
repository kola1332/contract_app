// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/core/usecases/usecase.dart';
import 'package:contract_app/features/card/domain/entities/basket_entity.dart';
import 'package:contract_app/features/card/domain/repositories/basket_repository.dart';

class GetBasketItems extends Usecase<List<BasketItemsEntity>> {
  final BasketRepository basketRepository;

  GetBasketItems(this.basketRepository);

  @override
  Future<Either<Failure, List<BasketItemsEntity>>> call() async {
    return await basketRepository.getBasketItem();
  }
}

class GetBasket extends Usecase<List<BasketEntity>> {
  final BasketRepository basketRepository;

  GetBasket(this.basketRepository);

  @override
  Future<Either<Failure, List<BasketEntity>>> call() async {
    return await basketRepository.getBasket();
  }
}
