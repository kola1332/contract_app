// ignore_for_file: constant_identifier_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/error/failure.dart';
import '/feature/domain/entities/phone_entity.dart';
import '/feature/domain/usecases/get_phonesHS.dart';
import '/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PhoneListCubit extends Cubit<PhoneListState> {
  final GetPhonesHS getPhonesHS;

  PhoneListCubit({required this.getPhonesHS}) : super(PhoneListEmpty());

  // int page = 1;

  void loadPerson() async {
    if (state is PhoneListLoading) return;

    final currentState = state;

    var oldPhones = <PhoneHSEntity>[];
    if (currentState is PhoneListLoaded) {
      oldPhones = currentState.phonesHSList;
    }

    emit(PhoneListLoading(oldPhones));

    final failureOrPerson = await getPhonesHS();

    failureOrPerson.fold(
        (error) => emit(PhoneListError(message: _mapFailureToMessage(error))),
        (phone) {
      final phones = (state as PhoneListLoading).oldPhonesList;
      phones.addAll(phone);
      print('List length: ${phones.length.toString()}');
      emit(PhoneListLoaded(phones));
    });
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
