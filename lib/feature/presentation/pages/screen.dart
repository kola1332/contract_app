// ignore_for_file: avoid_print

import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_bloc/phone_bloc.dart';
import 'package:contract_app/feature/presentation/bloc/phone_bloc/phone_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    List<PhoneHomeStoreEntity> phonesHomeStore = [];
    return BlocProvider<PhoneBloc, PhoneState>(
      create: (context) {
        PhoneBloc(getPhonesHomeStore: phonesHomeStore))
      },
      child: Scaffold(),
    );
    // return BlocBuilder<PhoneBloc, PhoneState>(
    //   builder: ((context, state) {
    //     List<PhoneHomeStoreEntity> phonesHomeStore = [];
    //     if (state is PhoneLoading) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (state is PhoneLoaded) {
    //       phonesHomeStore = state.phonesHomeStore;
    //       print(phonesHomeStore);
    //       print(phonesHomeStore.length);
    //     }
    //     print(phonesHomeStore);
    //     print(phonesHomeStore.length);
    //     return Scaffold(
    //       body: Container(
    //         child: Center(child: Text('${phonesHomeStore.length}')),
    //       ),
    //     );
    //   }),
    // );
  }
}
