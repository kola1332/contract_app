import 'package:dartz/dartz.dart';

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/core/platform/network_info.dart';
import 'package:contract_app/features/card/data/datasources/basket_local_data_source.dart';
import 'package:contract_app/features/card/data/datasources/basket_remote_data_source.dart';
import 'package:contract_app/features/card/data/models/basket_model.dart';
import 'package:contract_app/features/card/domain/repositories/basket_repository.dart';

class BasketRepositoryImpl implements BasketRepository {
  final BasketRemoteDataSource remoteDataSource;
  final BasketLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BasketRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<BasketItemsModel>>> getBasketItem() async {
    try {
      final localBasketItems =
          await localDataSource.getLastBasketItemFromCache();
      return Right(localBasketItems);
    } on CacheException {
      if (await networkInfo.isConnected) {
        try {
          List<BasketItemsModel> remoteBasketItems =
              await remoteDataSource.getBasketItem();
          localDataSource.basketItemToCache(remoteBasketItems);
          return Right(remoteBasketItems);
        } on ServerFailure {
          return Left(ServerFailure());
        }
      } else {
        try {
          final localBasketItems =
              await localDataSource.getLastBasketItemFromCache();
          return Right(localBasketItems);
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    }
  }

  @override
  Future<Either<Failure, List<BasketModel>>> getBasket() async {
    try {
      final localBasket = await localDataSource.getLastBasketFromCache();
      return Right(localBasket);
    } on CacheException {
      if (await networkInfo.isConnected) {
        try {
          List<BasketModel> remoteBasket = await remoteDataSource.getBasket();
          localDataSource.basketToCache(remoteBasket);
          return Right(remoteBasket);
        } on ServerFailure {
          return Left(ServerFailure());
        }
      } else {
        try {
          final localBasket = await localDataSource.getLastBasketFromCache();
          return Right(localBasket);
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    }
  }
}
