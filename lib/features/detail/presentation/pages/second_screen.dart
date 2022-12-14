// ignore_for_file: avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:contract_app/components/common/app_colors.dart';
import 'package:contract_app/features/detail/domain/entities/phone_detail_entity.dart';
import 'package:contract_app/features/card/presentation/pages/cart.dart';
import 'package:contract_app/features/detail/presentation/bloc/detail_list_cubit.dart';
import 'package:contract_app/features/detail/presentation/bloc/detail_list_state.dart';
import 'package:contract_app/features/detail/presentation/widgets/carouse_card.dart';
import 'package:contract_app/features/detail/presentation/widgets/loading.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _focus = false;
  bool _focus1 = false;
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
      body: BlocBuilder<DetailListCubit, DetailListState>(
          builder: (context, state) {
        List<PhoneDetailEntity> phonesDetail = [];
        if (state is DetailListLoading) {
          return loadingIndicator();
        } else if (state is DetailListLoaded) {
          phonesDetail = state.phonesDetail;
        }
        PhoneDetailEntity phone = phonesDetail[0];
        List<Color> paint = [];
        List<String> g = [];
        for (int i = 0; i < phone.color.length; i++) {
          g.add(phone.color[i].substring(1));
          g[i] = '0xFF' + g[i];
          paint.add(Color(int.parse(g[i]) as int));
        }
        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
                                'lib/components/assets/images/second_screen/back.svg'),
                          ),
                          const Text(
                            'Product Details',
                            style: TextStyle(
                              fontFamily: 'MarkPro',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const Cart(),
                                withNavBar: false,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
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
                                'lib/components/assets/images/second_screen/market.svg'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: CarouselSlider.builder(
                        itemCount: phone.images.length,
                        options: CarouselOptions(
                          // padEnds: false,
                          height: 280,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        itemBuilder: ((context, index, realIndex) {
                          return carouseCard(phone.images[index]);
                        }),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 6,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 1,
                            offset: const Offset(0, -6),
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.grey.shade50,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 26, right: 26, top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              phone.title,
                              style: const TextStyle(
                                fontFamily: 'MarkPro',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    const Size(40, 40)),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.accentColorBlue),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                              onPressed: () {},
                              child: SvgPicture.asset(
                                  'lib/components/assets/images/second_screen/favorite2.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Column(
                        children: [
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
                          const SizedBox(height: 20),
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Select color and capacity',
                                style: TextStyle(
                                  fontFamily: 'MarkPro',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _focus = false;
                                  });
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(50, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all(paint[0]),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColors.accentColorBlue),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80))),
                                ),
                                child: SvgPicture.asset(
                                  'lib/components/assets/images/second_screen/ok.svg',
                                  color: _focus == false
                                      ? Colors.white
                                      : Colors.transparent,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              const SizedBox(width: 15),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _focus = true;
                                  });
                                },
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(50, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all(paint[1]),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColors.accentColorBlue),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80))),
                                ),
                                child: SvgPicture.asset(
                                  'lib/components/assets/images/second_screen/ok.svg',
                                  color: _focus == true
                                      ? Colors.white
                                      : Colors.transparent,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              const SizedBox(width: 30),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _focus1 = false;
                                  });
                                },
                                style: ButtonStyle(
                                  maximumSize: MaterialStateProperty.all(
                                      const Size(120, 40)),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(80, 40)),
                                  backgroundColor: _focus1 == false
                                      ? MaterialStateProperty.all(
                                          AppColors.accentColorOrange)
                                      : MaterialStateProperty.all(
                                          Colors.transparent),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColors.accentColorBlue),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                                child: Text(
                                  '128 GB',
                                  style: TextStyle(
                                    fontFamily: 'MarkPro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: _focus1 == false
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _focus1 = true;
                                  });
                                },
                                style: ButtonStyle(
                                  maximumSize: MaterialStateProperty.all(
                                      const Size(120, 40)),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(80, 40)),
                                  backgroundColor: _focus1 == true
                                      ? MaterialStateProperty.all(
                                          AppColors.accentColorOrange)
                                      : MaterialStateProperty.all(
                                          Colors.transparent),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColors.accentColorBlue),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                                child: Text(
                                  '256 GB',
                                  style: TextStyle(
                                    fontFamily: 'MarkPro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: _focus1 == true
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                              style: ButtonStyle(
                                maximumSize: MaterialStateProperty.all(
                                    const Size(370, 60)),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(370, 60)),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.accentColorOrange),
                                foregroundColor: MaterialStateProperty.all(
                                    AppColors.accentColorBlue),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(9))),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Add to Card            \$${phone.price}.00',
                                style: const TextStyle(
                                    fontFamily: 'MarkPro',
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _star() {
    return SvgPicture.asset(
        'lib/components/assets/images/second_screen/star.svg');
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
            child: SvgPicture.asset(
                'lib/components/assets/images/second_screen/$path.svg')),
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
