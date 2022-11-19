import 'package:contract_app/core/platform/network_info.dart';
import 'package:contract_app/feature/data/datasources/phone_local_data_source.dart';
import 'package:contract_app/feature/data/datasources/phone_remote_data_source.dart';
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
        List<PhoneHomeStoreModel> remotePhoneHD =
            await remoteDataSource.getPhonesHomeStore();
        localDataSource.phonesHomeStoreToCache(remotePhoneHD);
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
}
