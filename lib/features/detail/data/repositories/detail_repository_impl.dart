import 'package:dartz/dartz.dart';

import 'package:contract_app/core/error/exception.dart';
import 'package:contract_app/core/platform/network_info.dart';
import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/detail/data/models/phone_detail_model.dart';
import 'package:contract_app/features/detail/data/datasources/detail_local_data_source.dart';
import 'package:contract_app/features/detail/data/datasources/detail_remote_data_source.dart';
import 'package:contract_app/features/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource remoteDataSource;
  final DetailLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DetailRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<PhoneDetailModel>>> getPhonesDetail() async {
    try {
      final localPhonesHomeStore =
          await localDataSource.getLastPhonesDetailFromCache();
      // print('1');
      return Right(localPhonesHomeStore);
    } on CacheException {
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
  }
}
