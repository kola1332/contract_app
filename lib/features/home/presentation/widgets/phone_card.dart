// ignore_for_file: sized_box_for_whitespaceblurRadius

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:contract_app/components/lang/assets.dart';

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
              SizedBox(
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
                    onPressed: () {},
                    child: isFavorite
                        ? SvgPicture.asset(
                            Assets.favoriteSplash,
                            width: 15,
                            height: 15,
                          )
                        : SvgPicture.asset(
                            Assets.favorite,
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
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '\$$priceWithoutDiscount',
                style: const TextStyle(
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
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
