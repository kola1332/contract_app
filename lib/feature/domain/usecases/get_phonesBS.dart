// ignore_for_file: file_names

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

// class GetPhones extends Usecase<List<PhoneEntity>, Params>{
class GetPhonesBS {
  final PhoneRepository phoneRepository;

  GetPhonesBS(this.phoneRepository);

  Future<Either<Failure, List<PhoneBSEntity>>> call() async {
    return await phoneRepository.getPhonesBS();
  }
}
