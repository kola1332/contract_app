// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:contract_app/components/common/app_colors.dart';

class Rounded extends StatefulWidget {
  const Rounded({super.key});

  @override
  State<Rounded> createState() => _RoundedState();
}

class _RoundedState extends State<Rounded> {
  late int _i = 0;
  MaterialStatesController? statesController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: TextButton(
                          key: const Key('1'),
                          onPressed: () {
                            setState(() {
                              _i = 0;
                            });
                          },
                          autofocus: true,
                          statesController: statesController,
                          style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.amber),
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _i == 0
                                ? MaterialStateProperty.all(
                                    (AppColors.accentColorOrange))
                                : MaterialStateProperty.all((Colors.white)),
                            foregroundColor: MaterialStateProperty.all(
                                AppColors.accentColorBlue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80))),
                          ),
                          child: SvgPicture.asset(
                            'lib/components/assets/images/first_screen/phone.svg',
                            color:
                                _i == 0 ? Colors.white : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Phones',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _i == 0
                                ? AppColors.accentColorOrange
                                : AppColors.accentColorBlue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: TextButton(
                          key: const Key('2'),
                          onPressed: () {
                            setState(() {
                              _i = 1;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _i == 1
                                ? MaterialStateProperty.all(
                                    (AppColors.accentColorOrange))
                                : MaterialStateProperty.all((Colors.white)),
                            foregroundColor: MaterialStateProperty.all(
                                AppColors.accentColorBlue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80))),
                          ),
                          child: SvgPicture.asset(
                            'lib/components/assets/images/first_screen/computer.svg',
                            color:
                                _i == 1 ? Colors.white : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Computer',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _i == 1
                                ? AppColors.accentColorOrange
                                : AppColors.accentColorBlue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: TextButton(
                          key: const Key('3'),
                          onPressed: () {
                            setState(() {
                              _i = 2;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _i == 2
                                ? MaterialStateProperty.all(
                                    (AppColors.accentColorOrange))
                                : MaterialStateProperty.all((Colors.white)),
                            foregroundColor: MaterialStateProperty.all(
                                AppColors.accentColorBlue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80))),
                          ),
                          child: SvgPicture.asset(
                            'lib/components/assets/images/first_screen/heart.svg',
                            color:
                                _i == 2 ? Colors.white : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Health',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _i == 2
                                ? AppColors.accentColorOrange
                                : AppColors.accentColorBlue),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: TextButton(
                          key: const Key('4'),
                          onPressed: () {
                            setState(() {
                              _i = 3;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _i == 3
                                ? MaterialStateProperty.all(
                                    (AppColors.accentColorOrange))
                                : MaterialStateProperty.all((Colors.white)),
                            foregroundColor: MaterialStateProperty.all(
                                AppColors.accentColorBlue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80))),
                          ),
                          child: SvgPicture.asset(
                            'lib/components/assets/images/first_screen/books.svg',
                            color:
                                _i == 3 ? Colors.white : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Books',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _i == 3
                                ? AppColors.accentColorOrange
                                : AppColors.accentColorBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
