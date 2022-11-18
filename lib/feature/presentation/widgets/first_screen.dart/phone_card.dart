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
      height: 120,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                child: Image.network(picture),
              ),
              IconButton(
                alignment: Alignment.topRight,
                onPressed: () {},
                icon: isFavorite
                    ? SvgPicture.asset('lib/assets/images/favorite.svg')
                    : SvgPicture.asset('lib/assets/images/favorite_splash.svg'),
              )
            ],
          ),
          Row(
            children: [
              Text(
                '$priceDiscount',
                style: const TextStyle(),
              ),
              Text(
                '$priceWithoutDiscount',
                style: const TextStyle(),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
