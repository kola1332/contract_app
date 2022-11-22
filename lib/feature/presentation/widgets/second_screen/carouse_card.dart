// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

Widget carouseCard(String picture) {
  return Container(
    padding: const EdgeInsets.all(10),
    // margin: EdgeInsets.all(10),
    // color: Colors.deepPurpleAccent,
    height: 260, //280
    width: 260, //280

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      boxShadow: <BoxShadow>[
        // BoxShadow(
        //   color: Colors.grey.shade300,
        //   blurRadius: 0.001,
        //   spreadRadius: 0.001,
        //   blurStyle: BlurStyle.solid,
        //   offset: Offset.fromDirection(2, 0),
        //   // offset: Offset.infinite,
        // ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.11), //0.12
          spreadRadius: 0.1,
          blurRadius: 10,
          // offset: const Offset(0, 1),
        ),
      ],
    ),

    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.network(
        picture,
        fit: BoxFit.contain,
      ),
    ),
  );
}
