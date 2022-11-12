// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';

abstract class PhoneRepository {
  Future<Either<Failure, List<PhoneHSEntity>>> getPhonesHS();
  Future<Either<Failure, List<PhoneBSEntity>>> getPhonesBS();
}
