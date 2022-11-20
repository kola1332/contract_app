// ignore_for_file: constant_identifier_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:contract_app/feature/presentation/bloc/phone_bloc/phone_event.dart';
import 'package:contract_app/feature/presentation/bloc/phone_bloc/phone_state.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/usecases/get_phonesHomeStore.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final GetPhonesHomeStore getPhonesHomeStore;

  PhoneBloc({required this.getPhonesHomeStore}) : super(PhoneEmpty()) {
    go();
    on<GetPhones>(_onEvent);
  }

  Future<void> go() async {
    final failureOrPhone = await getPhonesHomeStore();
  }

  Future<void> _onEvent(GetPhones event, Emitter<PhoneState> emit) async {
    emit(PhoneLoading());
    final failureOrPhone = await getPhonesHomeStore();
    emit(failureOrPhone.fold(
      (failure) => PhoneError(message: _mapFailureToMessage(failure)),
      (phone) => PhoneLoaded(phonesHomeStore: phone),
    ));
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
