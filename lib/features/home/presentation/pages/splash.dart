import 'dart:async';

import 'package:contract_app/components/common/app_colors.dart';
import 'package:contract_app/components/lang/assets.dart';
import 'package:contract_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), (() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }));
    return Scaffold(
      backgroundColor: AppColors.accentColorBlue,
      body: Center(child: Image.asset(Assets.brand)),
    );
  }
}
