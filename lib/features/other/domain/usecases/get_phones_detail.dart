// ignore_for_file: file_names

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/other/domain/entities/phone_detail_entity.dart';
import 'package:contract_app/features/other/domain/repositories/phone_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';

class GetPhonesDetail extends Usecase<List<PhoneDetailEntity>> {
  final PhoneRepository phoneRepository;

  GetPhonesDetail(this.phoneRepository);

  @override
  Future<Either<Failure, List<PhoneDetailEntity>>> call() async {
    return await phoneRepository.getPhonesDetail();
  }
}
