// ignore_for_file: sized_box_for_whitespace

import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/common/app_text_style.dart';
import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit/phone_list_state.dart';
import 'package:contract_app/feature/presentation/pages/second_screen.dart';
import 'package:contract_app/feature/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../widgets/first_screen/card_sales.dart';
import '../widgets/first_screen/phone_card.dart';
import '../widgets/first_screen/rounded.dart';

class FIrstScreen extends StatelessWidget {
  const FIrstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneListCubit, PhoneListState>(
      builder: (context, state) {
        List<PhoneHomeStoreEntity> phonesHomeStore = [];
        List<PhoneBestSellerEntity> phonesBestSeller = [];
        if (state is PhoneListLoading) {
          return loadingIndicator();
        } else if (state is PhoneListLoaded) {
          phonesHomeStore = state.phonesHomeStoreList;
          phonesBestSeller = state.phonesBestSellerList;
        }
        final phone1 = phonesBestSeller[0];
        final phone2 = phonesBestSeller[1];
        final phone3 = phonesBestSeller[2];
        final phone4 = phonesBestSeller[3];
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
                          'lib/assets/images/first_screen/search.svg',
                          height: 10,
                          width: 10,
                          fit: BoxFit.none,
                        ),
                        suffixIcon: SvgPicture.asset(
                          'lib/assets/images/first_screen/search.svg',
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
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
                      itemCount: phonesHomeStore.length,
                      itemBuilder: (context, index) {
                        final phone = phonesHomeStore[index];
                        return listViewViewer(
                          phone.picture,
                          phone.title,
                          phone.subtitle,
                          phone.is_new,
                          (() {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => const SecondScreen(),
                            //   ),
                            // );
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const SecondScreen(),
                              withNavBar: false,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              (() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SecondScreen(),
                                  ),
                                );
                              });
                            },
                            child: Container(
                              child: phoneCard(
                                phone1.picture,
                                phone1.title,
                                phone1.discount_price,
                                phone1.price_without_discount,
                                phone1.is_favorites,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              (() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SecondScreen(),
                                  ),
                                );
                              });
                            },
                            child: Container(
                              child: phoneCard(
                                phone4.picture,
                                phone3.title,
                                phone3.discount_price,
                                phone3.price_without_discount,
                                phone3.is_favorites,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              (() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SecondScreen(),
                                  ),
                                );
                              });
                            },
                            child: Container(
                              child: phoneCard(
                                phone2.picture,
                                phone2.title,
                                phone2.discount_price,
                                phone2.price_without_discount,
                                phone2.is_favorites,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              (() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SecondScreen(),
                                  ),
                                );
                              });
                            },
                            child: Container(
                                child: phoneCard(
                              phone4.picture,
                              phone4.title,
                              phone4.discount_price,
                              phone4.price_without_discount,
                              phone4.is_favorites,
                            )),
                          )
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
            //       // return Text('${phonesHomeStore[index]}');
            //       return PhoneCard(phoneHomeStore: phonesHomeStore[index]);
            //     },
            //     scrollDirection: Axis.vertical,
            //     itemCount: phonesHomeStore.length,
            //     separatorBuilder: (BuildContext context, int index) {
            //       return const Divider(
            //         height: 10,
            //         color: Colors.grey,
            //       );
            //     },
            //   ),
            // ),
            // Cont(phoneHomeStore: phonesHomeStore),
          ],
        );
      },
    );
  }
}
