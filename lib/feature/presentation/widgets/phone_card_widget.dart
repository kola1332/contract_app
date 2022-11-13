import 'package:contract_app/feature/domain/entities/phone_entity.dart';
import 'package:flutter/material.dart';

class PhoneCard extends StatelessWidget {
  final PhoneHSEntity phoneHS;
  const PhoneCard({super.key, required this.phoneHS});

  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(8),
        // ),
        // child: Row(
        //   children: [
        //     // ignore: sized_box_for_whitespace
        //     Container(
        //       height: 348,
        //       width: 221,
        //       child: Image.network(phoneHS.picture),
        //     ),
        //   ],
        // ),
        );
  }
}
