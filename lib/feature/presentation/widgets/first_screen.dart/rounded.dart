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
                // MyIcons(
                //     const Icon(Icons.phone, size: 35),
                //     const Text('Phones',
                //         style: TextStyle(fontFamily: 'MarkPro'))),
                // MyIcons(const Icon(Icons.computer, size: 35),
                //     const Text('Computer')),
                // MyIcons(const Icon(Icons.favorite_rounded, size: 35),
                //     const Text('Health')),
                // MyIcons(const Icon(Icons.my_library_books_rounded, size: 35),
                //     const Text('Books')),

                // TextButton(
                //   onPressed: () {
                //     setState(() {
                //       _focus1 = true;
                //       _focus2 = false;
                //       _focus3 = false;
                //       _focus4 = false;
                //     });
                //   },
                //   style: ButtonStyle(
                //     minimumSize: MaterialStateProperty.all(const Size(75, 75)),
                //     backgroundColor: _focus1 != false
                //         ? MaterialStateProperty.all(
                //             (AppColors.accentColorOrange))
                //         : MaterialStateProperty.all((Colors.white)),
                //     foregroundColor:
                //         MaterialStateProperty.all(AppColors.accentColorBlue),
                //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(80))),
                //   ),
                //   child: const Icon(Icons.my_library_books_rounded, size: 35),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextButton(
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
                        child: Icon(
                          Icons.phone_android,
                          size: 35,
                          color: _focus1 != false
                              ? Colors.white
                              : AppColors.accentGray,
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
                      // SvgPicture.asset('lib/assets/images/phone.svg'),
                      // Image.asset('lib/assets/images/phone.svg'),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      // TextButton(
                      //   key: const Key('2'),
                      //   onPressed: () {
                      //     setState(() {
                      //       _focus2 = true;
                      //       _focus1 = false;
                      //       _focus3 = false;
                      //       _focus4 = false;
                      //     });
                      //   },
                      //   style: ButtonStyle(
                      //     minimumSize:
                      //         MaterialStateProperty.all(const Size(75, 75)),
                      //     backgroundColor: _focus2 != false
                      //         ? MaterialStateProperty.all(
                      //             (AppColors.accentColorOrange))
                      //         : MaterialStateProperty.all((Colors.white)),
                      //     foregroundColor: MaterialStateProperty.all(
                      //         AppColors.accentColorBlue),
                      //     shape: MaterialStateProperty.all(
                      //         RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(80))),
                      //   ),
                      //   child: Icon(
                      //     Icons.computer,
                      //     size: 35,
                      //     color: _focus2 != false
                      //         ? Colors.white
                      //         : AppColors.accentGray,
                      //   ),
                      // ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('lib/assets/images/phone.svg'),
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
                        color: _focus3 != false
                            ? Colors.white
                            : AppColors.accentGray,
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
                      TextButton(
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
                        child: Icon(
                          Icons.heart_broken,
                          size: 35,
                          color: _focus3 != false
                              ? Colors.white
                              : AppColors.accentGray,
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
                      TextButton(
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
                        child: Icon(
                          Icons.library_books_rounded,
                          size: 35,
                          color: _focus4 != false
                              ? Colors.white
                              : AppColors.accentGray,
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

  // Widget MyIcons(Icon icon, Text text) {
  //   bool focus = false;
  //   return Padding(
  //     padding: const EdgeInsets.all(8),
  //     child: Column(
  //       children: [
  //         TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 focus = true;
  //               });
  //             },
  //             style: ButtonStyle(
  //               minimumSize: MaterialStateProperty.all(const Size(75, 75)),
  //               backgroundColor: focus != false
  //                   ? MaterialStateProperty.all((AppColors.accentColorOrange))
  //                   : MaterialStateProperty.all((Colors.white)),
  //               foregroundColor:
  //                   MaterialStateProperty.all(AppColors.accentColorBlue),
  //               shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(80))),
  //             ),
  //             focusNode: FocusNode(),
  //             child: icon),
  //         text,
  //       ],
  //     ),
  //   );
  // }
}
