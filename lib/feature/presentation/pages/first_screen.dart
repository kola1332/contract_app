import 'package:contract_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.mainBackground,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: true,
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
                  fontSize: 15),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFFB3B3B3),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.filter_alt_outlined,
              color: AppColors.accentColorBlue,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: const HomePage(),
    );
  }
}
