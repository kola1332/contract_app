// ignore_for_file: constant_identifier_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_phonesBS.dart';
import '/core/error/failure.dart';
import '/feature/domain/entities/phone_entity.dart';
import '/feature/domain/usecases/get_phonesHS.dart';
import '/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PhoneListCubit extends Cubit<PhoneListState> {
  final GetPhonesHS getPhonesHS;
  final GetPhonesBS getPhonesBS;

  PhoneListCubit({required this.getPhonesHS, required this.getPhonesBS})
      : super(PhoneListEmpty());

  void loadPhones() async {
    if (state is PhoneListLoading) return;

    final currentState = state;

    var oldPhonesHS = <PhoneHSEntity>[];
    var oldPhonesBS = <PhoneBSEntity>[];

    if (currentState is PhoneListLoaded) {
      oldPhonesHS = currentState.phonesHSList;
      oldPhonesBS = currentState.phonesBSList;
    }

    emit(PhoneListLoading(oldPhonesHS, oldPhonesBS));

    final failureOrPhoneHS = await getPhonesHS();
    final failureOrPhoneBS = await getPhonesBS();
    final phonesHS = (state as PhoneListLoading).oldPhonesHSList;
    final phonesBS = (state as PhoneListLoading).oldPhonesBSList;

    failureOrPhoneHS.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (phoneHS) {
      // final phonesHS = (state as PhoneListLoading).oldPhonesHSList;
      phonesHS.addAll(phoneHS);
      // print('List length: ${phonesHS.length.toString()}');
    });

    failureOrPhoneBS.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (phoneBS) {
      // final phonesBS = (state as PhoneListLoading).oldPhonesBSList;
      phonesBS.addAll(phoneBS);
      // print('List length: ${phonesBS.length.toString()}');
    });

    emit(PhoneListLoaded(phonesHS, phonesBS));
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
