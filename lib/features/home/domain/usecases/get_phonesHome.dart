// ignore_for_file: file_names

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/home/data/models/phone_model.dart';
import 'package:contract_app/features/home/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class GetPhonesHomeStore extends Usecase<List<PhoneHomeStoreModel>> {
  final PhoneRepository phoneRepository;

  GetPhonesHomeStore(this.phoneRepository);

  @override
  Future<Either<Failure, List<PhoneHomeStoreModel>>> call() async {
    return await phoneRepository.getPhonesHomeStore();
  }
}

class GetPhonesBestSeller extends Usecase<List<PhoneBestSellerModel>> {
  final PhoneRepository phoneRepository;

  GetPhonesBestSeller(this.phoneRepository);

  @override
  Future<Either<Failure, List<PhoneBestSellerModel>>> call() async {
    return await phoneRepository.getPhonesBestSeller();
  }
}
