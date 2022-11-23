import 'package:contract_app/features/other/domain/entities/basket_entity.dart';
import 'package:contract_app/features/other/domain/entities/phone_detail_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../home/domain/entities/phone_entity.dart';

abstract class PhoneListState extends Equatable {
  const PhoneListState();

  @override
  List<Object?> get props => [];
}

class PhoneListEmpty extends PhoneListState {}

class PhoneListLoading extends PhoneListState {
  final List<PhoneHomeStoreEntity> oldPhonesHomeStoreList;
  final List<PhoneBestSellerEntity> oldPhonesBestSellerList;
  final List<PhoneDetailEntity> oldPhonesDetailList;
  final List<BasketItemsEntity> oldBasketItemsList;
  final List<BasketEntity> oldBasketList;
  // final bool isFirstFetch;

  const PhoneListLoading(
      this.oldPhonesHomeStoreList,
      this.oldPhonesBestSellerList,
      this.oldPhonesDetailList,
      this.oldBasketItemsList,
      this.oldBasketList);

  @override
  List<Object?> get props => [];
}

class PhoneListLoaded extends PhoneListState {
  final List<PhoneHomeStoreEntity> phonesHomeStoreList;
  final List<PhoneBestSellerEntity> phonesBestSellerList;
  final List<PhoneDetailEntity> phonesDetail;
  final List<BasketItemsEntity> basketItems;
  final List<BasketEntity> baskets;

  const PhoneListLoaded(this.phonesHomeStoreList, this.phonesBestSellerList,
      this.phonesDetail, this.basketItems, this.baskets);

  @override
  List<Object?> get props => [phonesHomeStoreList, phonesBestSellerList];
}

class PhoneListError extends PhoneListState {
  final String message;

  const PhoneListError({required this.message});

  @override
  List<Object?> get props => [message];
}
