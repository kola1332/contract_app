import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/common/app_text_style.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/first_screen.dart/card_sales.dart';
import '../widgets/first_screen.dart/rounded.dart';

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
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Select Category',
                          style: AppTextStyle.header,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Text(
                          'view all',
                          style: TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 15,
                              color: AppColors.accentColorOrange),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const Rounded(),
                  Container(
                    height: 50,
                    // color: Colors.amber,
                    child: const Text(
                      'Hot sales',
                      style: AppTextStyle.header,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    height: 400,
                    // color: Colors.blue,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: phonesHS.length,
                      itemBuilder: (context, index) {
                        final phone = phonesHS[index];
                        return ListViewViewer(phone.picture, phone.title,
                            phone.subtitle, phone.is_new);
                      },
                    ),
                  ),
                  Container(
                    height: 400,
                    color: Colors.green,
                    child: Row(
                      children: [
                        const Text('Best Seller'),
                        const Text('see more'),
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Column(
                  //       children: [ListView()],
                  //     ),
                  //     Column(
                  //       children: [ListView()],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // Expanded(
            //   child: ListView.separated(
            //     itemBuilder: (context, index) {
            //       // return Text('${phonesHS[index]}');
            //       return PhoneCard(phoneHS: phonesHS[index]);
            //     },
            //     scrollDirection: Axis.vertical,
            //     itemCount: phonesHS.length,
            //     separatorBuilder: (BuildContext context, int index) {
            //       return const Divider(
            //         height: 10,
            //         color: Colors.grey,
            //       );
            //     },
            //   ),
            // ),
            // Cont(phoneHS: phonesHS),
          ],
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
