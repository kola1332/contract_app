import 'package:equatable/equatable.dart';

import 'package:contract_app/features/detail/domain/entities/phone_detail_entity.dart';

abstract class DetailListState extends Equatable {
  const DetailListState();

  @override
  List<Object?> get props => [];
}

class DetailListEmpty extends DetailListState {}

class DetailListLoading extends DetailListState {
  final List<PhoneDetailEntity> oldPhonesDetailList;
  const DetailListLoading(
    this.oldPhonesDetailList,
  );

  @override
  List<Object?> get props => [];
}

class DetailListLoaded extends DetailListState {
  final List<PhoneDetailEntity> phonesDetail;

  const DetailListLoaded(
    this.phonesDetail,
  );

  @override
  List<Object?> get props => [phonesDetail];
}

class DetailListError extends DetailListState {
  final String message;

  const DetailListError({required this.message});

  @override
  List<Object?> get props => [message];
}
