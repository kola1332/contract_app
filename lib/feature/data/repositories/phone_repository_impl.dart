import 'package:contract_app/core/platform/network_info.dart';
import 'package:contract_app/feature/data/datasources/phone_local_data_source.dart';
import 'package:contract_app/feature/data/datasources/phone_remote_data_source.dart';
import 'package:contract_app/feature/data/models/basket_model.dart';
import 'package:contract_app/feature/data/models/phone_detail_model.dart';
import 'package:contract_app/feature/data/models/phone_model.dart';
import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/feature/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';

class PhoneRepositoryImpl implements PhoneRepository {
  final PhoneRemoteDataSource remoteDataSource;
  final PhonesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PhoneRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<PhoneHomeStoreModel>>>
      getPhonesHomeStore() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePhoneHD = await remoteDataSource.getPhonesHomeStore();
        localDataSource.phonesHomeStoreToCache(remotePhoneHD); //
        return Right(remotePhoneHD);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPhonesHomeStore =
            await localDataSource.getLastPhonesHomeStoreFromCache();
        return Right(localPhonesHomeStore);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PhoneBestSellerModel>>>
      getPhonesBestSeller() async {
    if (await networkInfo.isConnected) {
      try {
        List<PhoneBestSellerModel> remotePhoneBestSeller =
            await remoteDataSource.getPhonesBestSeller();
        localDataSource.phonesBestSellerToCache(remotePhoneBestSeller);
        return Right(remotePhoneBestSeller);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPhonesBestSeller =
            await localDataSource.getLastPhonesBestSellerFromCache();
        return Right(localPhonesBestSeller);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PhoneDetailModel>>> getPhonesDetail() async {
    if (await networkInfo.isConnected) {
      try {
        List<PhoneDetailModel> remotePhoneDetail =
            await remoteDataSource.getPhonesDetail();
        localDataSource.phonesDetailToCache(remotePhoneDetail);
        return Right(remotePhoneDetail);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPhoneDetail =
            await localDataSource.getLastPhonesDetailFromCache();
        return Right(localPhoneDetail);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<BasketItemsModel>>> getBasketItem() async {
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

  //
  @override
  Future<Either<Failure, List<BasketModel>>> getBasket() async {
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
