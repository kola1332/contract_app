// ignore_for_file: constant_identifier_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:contract_app/core/error/failure.dart';
import 'package:contract_app/features/detail/presentation/bloc/detail_list_state.dart';
import 'package:contract_app/features/detail/domain/entities/phone_detail_entity.dart';
import 'package:contract_app/features/detail/domain/usecases/get_phones_detail.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class DetailListCubit extends Cubit<DetailListState> {
  final GetPhonesDetail getPhonesDetail;

  DetailListCubit({
    required this.getPhonesDetail,
  }) : super(DetailListEmpty());

  void loadDetailPhones() async {
    if (state is DetailListLoading) return;

    final currentState = state;

    var oldPhonesDetail = <PhoneDetailEntity>[];

    if (currentState is DetailListLoaded) {
      oldPhonesDetail = currentState.phonesDetail;
    }

    emit(DetailListLoading(oldPhonesDetail));

    final failureOrPhoneDetail = await getPhonesDetail();

    final phoneDetails = (state as DetailListLoading).oldPhonesDetailList;

    failureOrPhoneDetail.fold(
        (error) => emit(DetailListError(message: _mapFailureToMessage(error))),
        (phoneDetail) {
      phoneDetails.addAll(phoneDetail);
    });

    emit(DetailListLoaded(phoneDetails));
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
