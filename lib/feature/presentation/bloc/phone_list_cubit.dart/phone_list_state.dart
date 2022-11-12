import 'package:equatable/equatable.dart';

import '../../../domain/entities/phone_entity.dart';

abstract class PhoneListState extends Equatable {
  const PhoneListState();

  @override
  List<Object?> get props => [];
}

class PhoneListEmpty extends PhoneListState {
  @override
  List<Object?> get props => [];
}

class PhoneListLoading extends PhoneListState {
  final List<PhoneHSEntity> oldPhonesList;
  // final bool isFirstFetch;

  const PhoneListLoading(this.oldPhonesList);

  @override
  List<Object?> get props => [];
}

class PhoneListLoaded extends PhoneListState {
  final List<PhoneHSEntity> phonesHSList;

  const PhoneListLoaded(this.phonesHSList);

  @override
  List<Object?> get props => [phonesHSList];
}

class PhoneListError extends PhoneListState {
  final String message;

  const PhoneListError({required this.message});

  @override
  List<Object?> get props => [message];
}
