// ignore_for_file: constant_identifier_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_phonesBestSeller.dart';
import '/core/error/failure.dart';
import '/feature/domain/entities/phone_entity.dart';
import '/feature/domain/usecases/get_phonesHomeStore.dart';
import '/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PhoneListCubit extends Cubit<PhoneListState> {
  final GetPhonesHomeStore getPhonesHomeStore;
  final GetPhonesBestSeller getPhonesBestSeller;

  PhoneListCubit(
      {required this.getPhonesHomeStore, required this.getPhonesBestSeller})
      : super(PhoneListEmpty());

  void loadPhones() async {
    if (state is PhoneListLoading) return;

    final currentState = state;

    var oldPhonesHomeStore = <PhoneHomeStoreEntity>[];
    var oldPhonesBestSeller = <PhoneBestSellerEntity>[];

    if (currentState is PhoneListLoaded) {
      oldPhonesHomeStore = currentState.phonesHomeStoreList;
      oldPhonesBestSeller = currentState.phonesBestSellerList;
    }

    emit(PhoneListLoading(oldPhonesHomeStore, oldPhonesBestSeller));

    final failureOrPhoneHomeStore = await getPhonesHomeStore();
    final failureOrPhoneBestSeller = await getPhonesBestSeller();
    final phonesHomeStore = (state as PhoneListLoading).oldPhonesHomeStoreList;
    final phonesBestSeller =
        (state as PhoneListLoading).oldPhonesBestSellerList;

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

    emit(PhoneListLoaded(phonesHomeStore, phonesBestSeller));
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
