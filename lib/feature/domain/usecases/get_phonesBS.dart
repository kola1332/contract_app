// ignore_for_file: file_names

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';

class GetPhonesBS extends Usecase<List<PhoneEntity>> {
  final PhoneRepository phoneRepository;

  GetPhonesBS(this.phoneRepository);

  @override
  Future<Either<Failure, List<PhoneBSEntity>>> call() async {
    return await phoneRepository.getPhonesBS();
  }
}
