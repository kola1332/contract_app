import 'dart:async';

import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/feature/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), (() {
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: const HomePage(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }));
    return Scaffold(
      backgroundColor: AppColors.accentColorBlue,
      body: Center(child: Image.asset('lib/assets/brand.png')),
    );
  }
}
