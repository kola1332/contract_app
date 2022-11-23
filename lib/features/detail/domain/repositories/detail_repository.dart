// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/detail/domain/entities/phone_detail_entity.dart';

abstract class DetailRepository {
  Future<Either<Failure, List<PhoneDetailEntity>>> getPhonesDetail();
}
