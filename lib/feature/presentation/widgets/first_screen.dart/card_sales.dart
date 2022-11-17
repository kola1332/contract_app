import 'package:contract_app/common/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/phone_entity.dart';

Widget ListViewViewer(
  String picture,
  String text,
  String context,
  bool is_new,
) =>
    Container(
      margin: const EdgeInsets.all(9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            child: Stack(
          children: <Widget>[
            Container(
              width: 400,
              height: 200,
              child: Image.network(
                picture,
                fit: BoxFit.cover,
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  is_new
                      ? Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.accentColorOrange,
                          ),
                          child: const Text('NEW'),
                        )
                      : Container(),
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    context,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(120, 28)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text('Buy Now!'),
                  ),
                ]),
            // is_new
            // ? TextButton(onPressed: () {}, child: )
            // : Container(),
          ],
        )),
      ),
    );
