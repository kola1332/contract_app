// ignore_for_file: file_names

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/other/domain/entities/phone_entity.dart';
import 'package:contract_app/features/other/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class GetPhonesBestSeller extends Usecase<List<PhoneEntity>> {
  final PhoneRepository phoneRepository;

  GetPhonesBestSeller(this.phoneRepository);

  @override
  Future<Either<Failure, List<PhoneBestSellerEntity>>> call() async {
    return await phoneRepository.getPhonesBestSeller();
  }
}
