import 'package:contract_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/phones_home_page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.amber,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: true,
          statusBarColor: AppColors.mainBackground,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: AppColors.accentColorOrange,
            ),
            Text(
              'Zihuatanejo, Gro',
              style: TextStyle(
                color: AppColors.accentColorBlue,
                fontFamily: 'MarkPro',
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFFB3B3B3),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.filter_alt_outlined,
            color: AppColors.accentColorBlue,
          )
        ],
        centerTitle: true,
      ),
      body: const PhonesHomePageScreen(),
    );
  }
}
