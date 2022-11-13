import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhonesHomePageScreen extends StatelessWidget {
  const PhonesHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneListCubit, PhoneListState>(
      builder: (context, state) {
        List<PhoneHSEntity> phonesHS = [];
        if (state is PhoneListLoading) {
          return _loadingindicator();
        } else if (state is PhoneListLoaded) {
          phonesHS = state.phonesHSList;
          print(phonesHS);
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return Text('${phonesHS[index]}');
          },
          scrollDirection: Axis.vertical,
          itemCount: phonesHS.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.grey,
            );
          },
        );
      },
    );
  }

  Widget _loadingindicator() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
