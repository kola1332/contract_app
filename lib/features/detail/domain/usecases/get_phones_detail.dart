// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import 'package:contract_app/core/usecases/usecase.dart';
import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/detail/domain/repositories/detail_repository.dart';
import 'package:contract_app/features/detail/domain/entities/phone_detail_entity.dart';

class GetPhonesDetail extends Usecase<List<PhoneDetailEntity>> {
  final DetailRepository detailRepository;

  GetPhonesDetail(this.detailRepository);

  @override
  Future<Either<Failure, List<PhoneDetailEntity>>> call() async {
    return await detailRepository.getPhonesDetail();
  }
}
