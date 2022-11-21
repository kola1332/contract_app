// ignore_for_file: file_names

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/feature/domain/entities/basket_entity.dart';
import 'package:contract_app/feature/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';

class GetBasketItems extends Usecase<List<BasketItemsEntity>> {
  final PhoneRepository phoneRepository;

  GetBasketItems(this.phoneRepository);

  @override
  Future<Either<Failure, List<BasketItemsEntity>>> call() async {
    return await phoneRepository.getBasketItem();
  }
}

class GetBasket extends Usecase<List<BasketEntity>> {
  final PhoneRepository phoneRepository;

  GetBasket(this.phoneRepository);

  @override
  Future<Either<Failure, List<BasketEntity>>> call() async {
    return await phoneRepository.getBasket();
  }
}
