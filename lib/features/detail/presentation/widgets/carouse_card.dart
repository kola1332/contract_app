// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

Widget carouseCard(String picture) {
  return Container(
    padding: const EdgeInsets.all(10),
    height: 260,
    width: 260,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.11),
          spreadRadius: 0.1,
          blurRadius: 10,
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
