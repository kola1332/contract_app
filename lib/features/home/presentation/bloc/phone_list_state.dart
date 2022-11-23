import 'package:equatable/equatable.dart';

import 'package:contract_app/features/home/domain/entities/phone_entity.dart';

abstract class PhoneListState extends Equatable {
  const PhoneListState();

  @override
  List<Object?> get props => [];
}

class PhoneListEmpty extends PhoneListState {}

class PhoneListLoading extends PhoneListState {
  final List<PhoneHomeStoreEntity> oldPhonesHomeStoreList;
  final List<PhoneBestSellerEntity> oldPhonesBestSellerList;

  const PhoneListLoading(
    this.oldPhonesHomeStoreList,
    this.oldPhonesBestSellerList,
  );

  @override
  List<Object?> get props => [];
}

class PhoneListLoaded extends PhoneListState {
  final List<PhoneHomeStoreEntity> phonesHomeStoreList;
  final List<PhoneBestSellerEntity> phonesBestSellerList;

  const PhoneListLoaded(
    this.phonesHomeStoreList,
    this.phonesBestSellerList,
  );

  @override
  List<Object?> get props => [phonesHomeStoreList, phonesBestSellerList];
}

class PhoneListError extends PhoneListState {
  final String message;

  const PhoneListError({required this.message});

  @override
  List<Object?> get props => [message];
}
