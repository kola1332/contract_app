import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/common/app_text_style.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/first_screen.dart/rounded.dart';

class PhonesHomePageScreen extends StatelessWidget {
  const PhonesHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String assetName = 'lib/assets/images/phone.svg';
    final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');
    final Widget sv = SvgPicture.asset('lib/assets/images/phone.svg');

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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Select Category',
                        style: AppTextStyle.header,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'view all',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            color: AppColors.accentColorOrange),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  const Rounded(),
                  Container(
                    height: 400,
                    color: Colors.amber,
                    child: svg,
                  ),
                  Container(height: 400, color: Colors.blue),
                  Container(height: 400, color: Colors.green),
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