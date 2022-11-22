// ignore_for_file: constant_identifier_names, avoid_print

import 'package:contract_app/feature/domain/entities/basket_entity.dart';
import 'package:contract_app/feature/domain/entities/phone_detail_entity.dart';
import 'package:contract_app/feature/domain/usecases/get_basket.dart';
import 'package:contract_app/feature/domain/usecases/get_phones_detail.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit/phone_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_phonesBestSeller.dart';
import '/core/error/failure.dart';
import '/feature/domain/entities/phone_entity.dart';
import '/feature/domain/usecases/get_phonesHomeStore.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PhoneListCubit extends Cubit<PhoneListState> {
  final GetPhonesHomeStore getPhonesHomeStore;
  final GetPhonesBestSeller getPhonesBestSeller;
  final GetPhonesDetail getPhonesDetail;
  final GetBasketItems getBasketItems;
  final GetBasket getBasket;

  PhoneListCubit({
    required this.getPhonesHomeStore,
    required this.getPhonesBestSeller,
    required this.getPhonesDetail,
    required this.getBasketItems,
    required this.getBasket,
  }) : super(PhoneListEmpty());

  void loadPhones() async {
    if (state is PhoneListLoading) return;

    final currentState = state;

    var oldPhonesHomeStore = <PhoneHomeStoreEntity>[];
    var oldPhonesBestSeller = <PhoneBestSellerEntity>[];
    var oldPhonesDetail = <PhoneDetailEntity>[];
    var oldBasketItems = <BasketItemsEntity>[];
    var oldBasket = <BasketEntity>[];

    if (currentState is PhoneListLoaded) {
      oldPhonesHomeStore = currentState.phonesHomeStoreList;
      oldPhonesBestSeller = currentState.phonesBestSellerList;
      oldPhonesDetail = currentState.phonesDetail;
      oldBasketItems = currentState.basketItems;
      oldBasket = currentState.baskets;
    }

    emit(PhoneListLoading(oldPhonesHomeStore, oldPhonesBestSeller,
        oldPhonesDetail, oldBasketItems, oldBasket));

    final failureOrPhoneHomeStore = await getPhonesHomeStore();
    final failureOrPhoneBestSeller = await getPhonesBestSeller();
    final failureOrPhoneDetail = await getPhonesDetail();
    final failureOrBasketItems = await getBasketItems();
    final failureOrBasket = await getBasket();

    final phonesHomeStore = (state as PhoneListLoading).oldPhonesHomeStoreList;
    final phonesBestSeller =
        (state as PhoneListLoading).oldPhonesBestSellerList;
    final phoneDetails = (state as PhoneListLoading).oldPhonesDetailList;
    final basketItems = (state as PhoneListLoading).oldBasketItemsList;
    final baskets = (state as PhoneListLoading).oldBasketList;

    failureOrPhoneHomeStore.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (phoneHomeStore) {
      phonesHomeStore.addAll(phoneHomeStore);
      // print('List length: ${phonesHomeStore.length.toString()}');
    });

    failureOrPhoneBestSeller.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (phoneBestSeller) {
      phonesBestSeller.addAll(phoneBestSeller);
      // print('List length: ${phonesBestSeller.length.toString()}');
    });

    failureOrPhoneDetail.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (phoneDetail) {
      phoneDetails.addAll(phoneDetail);
      // print('List length: ${phonesBestSeller.length.toString()}');
    });

    failureOrBasketItems.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (basketItem) {
      basketItems.addAll(basketItem);
      // print('List length: ${phonesBestSeller.length.toString()}');
    });

    failureOrBasket.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (basket) {
      baskets.addAll(basket);
      // print('List length: ${phonesBestSeller.length.toString()}');
    });

    emit(PhoneListLoaded(
        phonesHomeStore, phonesBestSeller, phoneDetails, basketItems, baskets));
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
