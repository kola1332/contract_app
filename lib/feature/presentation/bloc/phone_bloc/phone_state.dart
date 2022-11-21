import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:equatable/equatable.dart';

abstract class PhoneState extends Equatable {
  const PhoneState();

  @override
  List<Object?> get props => [];
}

class PhoneEmpty extends PhoneState {}

class PhoneLoading extends PhoneState {}

class PhoneLoaded extends PhoneState {
  final List<PhoneHomeStoreEntity> phonesHomeStore;

  // ignore: prefer_const_constructors_in_immutables
  PhoneLoaded({required this.phonesHomeStore});

  @override
  List<Object?> get props => [phonesHomeStore];
}

class PhoneError extends PhoneState {
  final String message;

  const PhoneError({required this.message});

  @override
  List<Object?> get props => [message];
}
