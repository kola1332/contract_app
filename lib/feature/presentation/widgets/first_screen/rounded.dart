// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:contract_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Rounded extends StatefulWidget {
  const Rounded({super.key});

  @override
  State<Rounded> createState() => _RoundedState();
}

class _RoundedState extends State<Rounded> {
  late bool _focus1 = true;
  late bool _focus2 = false;
  late bool _focus3 = false;
  late bool _focus4 = false;
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
                              _focus1 = true;
                              _focus2 = false;
                              _focus3 = false;
                              _focus4 = false;
                            });
                          },
                          autofocus: true,
                          statesController: statesController,
                          style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.amber),
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _focus1 != false
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
                            'lib/assets/images/phone.svg',
                            color: _focus1 != false
                                ? Colors.white
                                : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Phones',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _focus1 != false
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
                              _focus1 = false;
                              _focus2 = true;
                              _focus3 = false;
                              _focus4 = false;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _focus2 != false
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
                            'lib/assets/images/computer.svg',
                            color: _focus2 != false
                                ? Colors.white
                                : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Computer',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _focus2 != false
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
                              _focus1 = false;
                              _focus2 = false;
                              _focus3 = true;
                              _focus4 = false;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _focus3 != false
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
                            'lib/assets/images/heart.svg',
                            color: _focus3 != false
                                ? Colors.white
                                : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Health',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _focus3 != false
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
                              _focus1 = false;
                              _focus2 = false;
                              _focus3 = false;
                              _focus4 = true;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(75, 75)),
                            backgroundColor: _focus4 != false
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
                            'lib/assets/images/books.svg',
                            color: _focus4 != false
                                ? Colors.white
                                : AppColors.accentGray,
                          ),
                        ),
                      ),
                      Text(
                        'Books',
                        style: TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: _focus4 != false
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
