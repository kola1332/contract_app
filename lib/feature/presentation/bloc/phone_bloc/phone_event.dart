import 'package:equatable/equatable.dart';

abstract class PhoneEvent extends Equatable {
  const PhoneEvent();

  @override
  List<Object?> get props => [];
}

class GetPhones extends PhoneEvent {}
