import 'package:contract_app/core/platform/network_info.dart';
import 'package:contract_app/feature/data/datasources/phone_local_data_source.dart';
import 'package:contract_app/feature/data/datasources/phone_remote_data_source.dart';
import 'package:contract_app/feature/data/models/phone_model.dart';
import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/feature/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';

class PhoneRepositoryImp implements PhoneRepository {
  final PhoneRemoteDataSource remoteDataSource;
  final PhonesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PhoneRepositoryImp(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<PhoneHSModel>>> getPhonesHS() async {
    if (await networkInfo.isConnected) {
      try {
        List<PhoneHSModel> remotePhoneHD = await remoteDataSource.getPhonesHS();
        localDataSource.phonesHSToCache(remotePhoneHD);
        return Right(remotePhoneHD);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPhonesHS = await localDataSource.getLastPhonesHSFromCache();
        return Right(localPhonesHS);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PhoneBSModel>>> getPhonesBS() async {
    if (await networkInfo.isConnected) {
      try {
        List<PhoneBSModel> remotePhoneBS = await remoteDataSource.getPhonesBS();
        localDataSource.phonesBSToCache(remotePhoneBS);
        return Right(remotePhoneBS);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPhonesBS = await localDataSource.getLastPhonesBSFromCache();
        return Right(localPhonesBS);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
