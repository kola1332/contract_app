// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:contract_app/components/common/app_colors.dart';
import 'package:contract_app/components/common/app_text_style.dart';
import 'package:contract_app/features/home/domain/entities/phone_entity.dart';
import 'package:contract_app/features/home/presentation/bloc/phone_list_cubit.dart';
import 'package:contract_app/features/home/presentation/bloc/phone_list_state.dart';
import 'package:contract_app/features/detail/presentation/pages/second_screen.dart';
import 'package:contract_app/features/home/presentation/widgets/loading.dart';
import 'package:contract_app/features/home/presentation/widgets/card_sales.dart';
import 'package:contract_app/features/home/presentation/widgets/phone_card.dart';
import 'package:contract_app/features/home/presentation/widgets/rounded.dart';

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
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                              'lib/components/assets/images/first_screen/filter.svg',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.accentColorOrange,
                            ),
                            Text(
                              'Zihuatanejo, Gro',
                              style: TextStyle(
                                color: AppColors.accentColorBlue,
                                fontFamily: 'MarkPro',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFFB3B3B3),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                                gapPadding: 15,
                              ),
                              labelText: 'Search',
                              prefixIcon: SvgPicture.asset(
                                'lib/components/assets/images/first_screen/search.svg',
                                height: 10,
                                width: 10,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(45, 45)),
                              backgroundColor: MaterialStateProperty.all(
                                  (AppColors.accentColorOrange)),
                              foregroundColor: MaterialStateProperty.all(
                                  AppColors.accentColorBlue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80))),
                            ),
                            child: SvgPicture.asset(
                              'lib/components/assets/images/first_screen/qr.svg',
                            ))
                      ],
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
                                phonesBestSeller[0].picture,
                                phonesBestSeller[0].title,
                                phonesBestSeller[0].discount_price,
                                phonesBestSeller[0].price_without_discount,
                                phonesBestSeller[0].is_favorites,
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
                                phonesBestSeller[3].picture,
                                phonesBestSeller[2].title,
                                phonesBestSeller[2].discount_price,
                                phonesBestSeller[2].price_without_discount,
                                phonesBestSeller[2].is_favorites,
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
                                phonesBestSeller[1].picture,
                                phonesBestSeller[1].title,
                                phonesBestSeller[1].discount_price,
                                phonesBestSeller[1].price_without_discount,
                                phonesBestSeller[1].is_favorites,
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
                              phonesBestSeller[3].picture,
                              phonesBestSeller[3].title,
                              phonesBestSeller[3].discount_price,
                              phonesBestSeller[3].price_without_discount,
                              phonesBestSeller[3].is_favorites,
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
