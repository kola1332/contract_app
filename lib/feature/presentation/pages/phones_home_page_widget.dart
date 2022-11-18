// ignore_for_file: sized_box_for_whitespace

import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/common/app_text_style.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/first_screen/card_sales.dart';
import '../widgets/first_screen/phone_card.dart';
import '../widgets/first_screen/rounded.dart';

class PhonesHomePageScreen extends StatelessWidget {
  const PhonesHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneListCubit, PhoneListState>(
      builder: (context, state) {
        List<PhoneHSEntity> phonesHS = [];
        List<PhoneBSEntity> phonesBS = [];
        if (state is PhoneListLoading) {
          return _loadingIndicator();
        } else if (state is PhoneListLoaded) {
          phonesHS = state.phonesHSList;
          phonesBS = state.phonesBSList;
          // print(phonesBS);
          // print(phonesBS.length);
        }
        final phone1 = phonesBS[0];
        final phone2 = phonesBS[1];
        final phone3 = phonesBS[2];
        final phone4 = phonesBS[3];
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                          gapPadding: 15,
                        ),
                        // border: const OutlineInputBorder(
                        //     borderSide: BorderSide(
                        //   width: 0.3,
                        //   strokeAlign: StrokeAlign.center,
                        // )),
                        // disabledBorder: InputBorder.none,
                        // border: OutlineInputBorder(),
                        labelText: 'Search',
                        prefixIcon: SvgPicture.asset(
                          'lib/assets/images/search.svg',
                          height: 10,
                          width: 10,
                          fit: BoxFit.none,
                        ),
                        suffixIcon: SvgPicture.asset(
                          'lib/assets/images/search.svg',
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: SvgPicture.asset(
                    //     'lib/assets/images/qr.svg',
                    //     // fit: BoxFit.none,
                    //   ),
                    // ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Hot sales',
                          style: AppTextStyle.header,
                        ),
                        Text(
                          'see more',
                          style: AppTextStyle.standard,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 224,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: phonesHS.length,
                      itemBuilder: (context, index) {
                        final phone = phonesHS[index];
                        return listViewViewer(phone.picture, phone.title,
                            phone.subtitle, phone.is_new);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    // height: 400,
                    // color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Best Seller',
                          style: AppTextStyle.header,
                        ),
                        Text(
                          'see more',
                          style: AppTextStyle.standard,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       Column(
                  //         children: [
                  //           Expanded(
                  //             child: ListView.builder(
                  //                 itemCount: phonesHS.length,
                  //                 itemBuilder: (context, index) {
                  //                   final phone = phonesBS[index];
                  //                   return phoneCard(
                  //                     phone.picture,
                  //                     phone.title,
                  //                     phone.discount_price,
                  //                     phone.price_without_discount,
                  //                     phone.is_favorites,
                  //                   );
                  //                 }),
                  //           )
                  //         ],
                  //       ),
                  //       // Column(
                  //       //   children: [Expanded(child: ListView())],
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   child: ListView.builder(
                  //       itemCount: phonesHS.length,
                  //       itemBuilder: (context, index) {
                  //         final phone = phonesBS[index];
                  //         return phoneCard(
                  //           phone.picture,
                  //           phone.title,
                  //           phone.discount_price,
                  //           phone.price_without_discount,
                  //           phone.is_favorites,
                  //         );
                  //       }),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            // height: 400,
                            // width: 150,
                            child: phoneCard(
                              phone1.picture,
                              phone1.title,
                              phone1.discount_price,
                              phone1.price_without_discount,
                              phone1.is_favorites,
                            ),
                          ),
                          Container(
                            // height: 400,
                            // width: 150,
                            child: phoneCard(
                              phone4.picture,
                              phone3.title,
                              phone3.discount_price,
                              phone3.price_without_discount,
                              phone3.is_favorites,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            // height: 400,
                            // width: 150,
                            child: phoneCard(
                              phone2.picture,
                              phone2.title,
                              phone2.discount_price,
                              phone2.price_without_discount,
                              phone2.is_favorites,
                            ),
                          ),
                          Container(
                            // height: 400,
                            // width: 150,
                            child: phoneCard(
                              phone4.picture,
                              phone4.title,
                              phone4.discount_price,
                              phone4.price_without_discount,
                              phone4.is_favorites,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
