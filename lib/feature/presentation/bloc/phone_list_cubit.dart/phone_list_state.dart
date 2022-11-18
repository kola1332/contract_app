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
  final List<PhoneHSEntity> oldPhonesHSList;
  final List<PhoneBSEntity> oldPhonesBSList;
  // final bool isFirstFetch;

  const PhoneListLoading(this.oldPhonesHSList, this.oldPhonesBSList);

  @override
  List<Object?> get props => [];
}

class PhoneListLoaded extends PhoneListState {
  final List<PhoneHSEntity> phonesHSList;
  final List<PhoneBSEntity> phonesBSList;

  const PhoneListLoaded(this.phonesHSList, this.phonesBSList);

  @override
  List<Object?> get props => [phonesHSList, phonesBSList];
}

class PhoneListError extends PhoneListState {
  final String message;

  const PhoneListError({required this.message});

  @override
  List<Object?> get props => [message];
}
