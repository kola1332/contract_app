import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/feature/domain/entities/basket_entity.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:contract_app/feature/presentation/bloc/phone_list_cubit/phone_list_state.dart';
import 'package:contract_app/feature/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

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
          List<BasketEntity> basket = [];
          if (state is PhoneListLoading) {
            return loadingIndicator();
          } else if (state is PhoneListLoaded) {
            basket = state.baskets;
          }
          return SafeArea(
              child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 27, top: 10),
                        child: TextButton(
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
                              'lib/assets/images/second_screen/back.svg'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 120, top: 10),
                        child: Text(
                          'Add address',
                          style: TextStyle(
                            fontFamily: 'MArkPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 27, top: 10),
                        child: TextButton(
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
                              'lib/assets/images/cart/location.svg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    child: Text(
                      'My Cart',
                      style: TextStyle(
                        fontFamily: 'MarkPro',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 600,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: AppColors.accentColorBlue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 60),
                        bottom(
                          basket[0].basket[0].images,
                          basket[0].basket[0].title,
                          basket[0].basket[0].price,
                        ),
                        const SizedBox(height: 43),
                        bottom(
                          basket[0].basket[1].images,
                          basket[0].basket[1].title,
                          basket[0].basket[1].price,
                        ),
                        const SizedBox(height: 130),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 82,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Total',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Delivery',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${basket[0].total}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    basket[0].delivery,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(35, 35),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.accentColorOrange),
                                  overlayColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 255, 77, 0)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                  ),
                                ),
                                child: const SizedBox(
                                  height: 1111,
                                  width: 1111,
                                  child: Center(
                                      child: Text(
                                    'Checkout',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  )),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 15)),
                    ],
                  ),
                ],
              ))
            ],
          ));
        }));
  }

  Widget bottom(String pic, String name, int price) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(top: 25, left: 25)), //left 30
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              image: NetworkImage(pic),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'MarkPro',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              '\$$price.00',
              style: const TextStyle(
                fontFamily: 'MarkPro',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.accentColorOrange,
              ),
            ),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                maximumSize: MaterialStateProperty.all(const Size(25, 80)),
                minimumSize: MaterialStateProperty.all(const Size(25, 80)),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF282843)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80))),
              ),
              child: const Text(
                '-  2  +',
                style: TextStyle(
                  fontFamily: 'MarkPro',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: SvgPicture.asset(
                'lib/assets/images/cart/delete.svg',
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
