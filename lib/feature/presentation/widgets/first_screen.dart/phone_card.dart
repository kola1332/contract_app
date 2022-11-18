import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget phoneCard(
  String picture,
  String title,
  int priceDiscount,
  int priceWithoutDiscount,
  bool isFavorite,
) =>
    Container(
      padding: const EdgeInsets.all(15),
      height: 290,
      width: 185,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                child: Image.network(
                  picture,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(15, 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    // alignment: Alignment.topRight,
                    onPressed: () {},
                    child: isFavorite
                        ? SvgPicture.asset(
                            'lib/assets/images/favorite_splash.svg',
                            width: 15,
                            height: 15,
                          )
                        : SvgPicture.asset(
                            'lib/assets/images/favorite.svg',
                            width: 15,
                            height: 15,
                          ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                '\$$priceDiscount',
                style: const TextStyle(
                  fontFamily: 'MarkPro',
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '\$$priceWithoutDiscount',
                style: const TextStyle(
                  fontFamily: 'MarkPro',
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'MarkPro',
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
