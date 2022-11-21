// ignore_for_file: avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/feature/domain/entities/phone_detail_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit.dart/phone_list_state.dart';
import 'package:contract_app/feature/presentation/widgets/loading.dart';
import 'package:contract_app/feature/presentation/widgets/second_screen/carouse_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<PhoneListCubit, PhoneListState>(
          builder: (context, state) {
        List<PhoneDetailEntity> phonesDetail = [];
        if (state is PhoneListLoading) {
          return loadingIndicator();
        } else if (state is PhoneListLoaded) {
          phonesDetail = state.phonesDetail;
        }
        PhoneDetailEntity phone = phonesDetail[0];
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(40, 40)),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.accentColorBlue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                            child: SvgPicture.asset(
                                'lib/assets/images/second_screen/back.svg'),
                          ),
                          const Text(
                            'Product Details',
                            style: TextStyle(
                              fontFamily: 'MArkPro',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(40, 40)),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.accentColorOrange),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                            child: SvgPicture.asset(
                                'lib/assets/images/second_screen/market.svg'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        child: CarouselSlider.builder(
                          itemCount: phone.images.length,
                          options: CarouselOptions(
                            height: 270, //265
                            enlargeCenterPage: true,
                          ),
                          itemBuilder: ((context, index, realIndex) {
                            return carouseCard(phone.images[index]);
                          }),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            phone.title,
                            style: const TextStyle(
                              fontFamily: 'markPro',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(40, 40)),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.accentColorBlue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                            onPressed: () {},
                            child: SvgPicture.asset(
                                'lib/assets/images/second_screen/favorite2.svg'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _star(),
                          const SizedBox(width: 7),
                          _star(),
                          const SizedBox(width: 7),
                          _star(),
                          const SizedBox(width: 7),
                          _star(),
                          const SizedBox(width: 7),
                          _star(),
                          const SizedBox(width: 7),
                        ],
                      ),
                      const SizedBox(height: 23),
                      DefaultTabController(
                        length: 3,
                        child: SizedBox(
                          height: 40,
                          child: TabBar(
                            indicatorPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 7,
                            ),
                            indicatorColor: AppColors.accentColorOrange,
                            indicatorWeight: 3,
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.black,
                            tabs: [
                              _tabText('Shop'),
                              _tabText('Details'),
                              _tabText('Features'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _icon('cpu', phone.CPU),
                          _icon('camera', phone.camera),
                          _icon('ssd', phone.ssd),
                          _icon('sd', phone.sd),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _star() {
    return SvgPicture.asset('lib/assets/images/second_screen/star.svg');
  }

  Widget _tabText(String text) {
    return FittedBox(
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'MarkPro',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _icon(String path, String name) {
    return Column(
      children: [
        SizedBox(
            height: 32,
            child:
                SvgPicture.asset('lib/assets/images/second_screen/$path.svg')),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'MarkPro',
            color: Colors.grey,
            fontSize: 11,
          ),
        )
      ],
    );
  }
}
