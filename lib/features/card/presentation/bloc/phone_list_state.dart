import 'package:equatable/equatable.dart';

import 'package:contract_app/features/card/domain/entities/basket_entity.dart';

abstract class BasketListState extends Equatable {
  const BasketListState();

  @override
  List<Object?> get props => [];
}

class BasketListEmpty extends BasketListState {}

class BasketListLoading extends BasketListState {
  final List<BasketItemsEntity> oldBasketItemsList;
  final List<BasketEntity> oldBasketList;

  const BasketListLoading(this.oldBasketItemsList, this.oldBasketList);

  @override
  List<Object?> get props => [];
}

class BasketListLoaded extends BasketListState {
  final List<BasketItemsEntity> basketItems;
  final List<BasketEntity> baskets;

  const BasketListLoaded(this.basketItems, this.baskets);

  @override
  List<Object?> get props => [basketItems, baskets];
}

class PhoneListError extends BasketListState {
  final String message;

  const PhoneListError({required this.message});

  @override
  List<Object?> get props => [message];
}
