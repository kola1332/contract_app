// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';

import 'package:contract_app/components/common/app_colors.dart';
import 'package:contract_app/components/common/app_text_style.dart';
import 'package:contract_app/components/lang/locale_eng.dart';

Widget listViewViewer(String picture, String text, String context, bool isNew,
        void function()) =>
    Padding(
      padding: const EdgeInsets.all(9),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 370,
              height: 200,
              child: Image.network(
                picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 55,
            child: isNew
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accentColorOrange,
                    ),
                    child: const Center(
                      child: Text(
                        LocalizationEng.newPhone,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: AppTextStyle.header.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    context,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextButton(
                    onPressed: () {
                      function();
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(120, 28)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text(
                      LocalizationEng.buy,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentColorBlue,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
