// ignore_for_file: constant_identifier_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/card/domain/entities/basket_entity.dart';
import 'package:contract_app/features/card/domain/usecases/get_basket.dart';
import 'package:contract_app/features/card/presentation/bloc/basket_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class BasketListCubit extends Cubit<BasketListState> {
  final GetBasketItems getBasketItems;
  final GetBasket getBasket;

  BasketListCubit({
    required this.getBasketItems,
    required this.getBasket,
  }) : super(BasketListEmpty());

  void loadBaskets() async {
    if (state is BasketListLoading) return;

    final currentState = state;

    var oldBasketItems = <BasketItemsEntity>[];
    var oldBasket = <BasketEntity>[];

    if (currentState is BasketListLoaded) {
      oldBasketItems = currentState.basketItems;
      oldBasket = currentState.baskets;
    }

    emit(BasketListLoading(oldBasketItems, oldBasket));

    final failureOrBasketItems = await getBasketItems();
    final failureOrBasket = await getBasket();

    final basketItems = (state as BasketListLoading).oldBasketItemsList;
    final baskets = (state as BasketListLoading).oldBasketList;

    failureOrBasketItems.fold(
        (error) => emit(BasketListError(message: _mapFailureToMessage(error))),
        (basketItem) {
      basketItems.addAll(basketItem);
    });

    failureOrBasket.fold(
        (error) => emit(BasketListError(message: _mapFailureToMessage(error))),
        (basket) {
      baskets.addAll(basket);
    });

    emit(BasketListLoaded(basketItems, baskets));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
