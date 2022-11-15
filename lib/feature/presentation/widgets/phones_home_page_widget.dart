import 'package:contract_app/common/app_text_style.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';
import 'package:contract_app/feature/presentation/widgets/container_builder.dart';
import 'package:contract_app/feature/presentation/widgets/phone_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhonesHomePageScreen extends StatelessWidget {
  const PhonesHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneListCubit, PhoneListState>(
      builder: (context, state) {
        // int index = 0;
        List<PhoneHSEntity> phonesHS = [];
        if (state is PhoneListLoading) {
          return _loadingIndicator();
        } else if (state is PhoneListLoaded) {
          phonesHS = state.phonesHSList;
          // ignore: avoid_print
          print(phonesHS);
        }
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Select Category',
                    style: AppTextStyle.header,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'view all',
                        style: TextStyle(fontFamily: 'MarkPro', fontSize: 15),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    // return Text('${phonesHS[index]}');
                    return PhoneCard(phoneHS: phonesHS[index]);
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: phonesHS.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 10,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              Cont(phoneHS: phonesHS),
            ],
          ),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
