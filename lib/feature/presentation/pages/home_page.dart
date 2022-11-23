import 'package:contract_app/common/app_colors.dart';
import 'package:contract_app/feature/presentation/pages/first_screen.dart';
import 'package:contract_app/feature/presentation/pages/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.mainBackground,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemStatusBarContrastEnforced: true,
          ),
          backgroundColor: Colors.transparent,
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
        bottomNavigationBar: PersistentTabView(
          context,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: AppColors.accentColorBlue,
          decoration: NavBarDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
          ),
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style1,
        ),
        body: const FIrstScreen(),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const FIrstScreen(),
      const SecondScreen(),
      const Card(),
      const FIrstScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: const TextStyle(color: Colors.white),
        icon: SvgPicture.asset('lib/assets/images/tabs/point.svg'),
        title: ("Explorer"),
        activeColorPrimary: AppColors.accentColorBlue,
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset('lib/assets/images/tabs/market.svg'),
          title: ("Market"),
          activeColorPrimary: AppColors.accentColorBlue,
          activeColorSecondary: Colors.white,
          onPressed: ((p0) {})),
      PersistentBottomNavBarItem(
          title: ("Favorites"),
          icon: SvgPicture.asset('lib/assets/images/tabs/favorites.svg'),
          activeColorPrimary: AppColors.accentColorBlue,
          activeColorSecondary: Colors.white,
          onPressed: ((p0) {})),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset('lib/assets/images/tabs/user.svg'),
          title: ("User"),
          activeColorPrimary: AppColors.accentColorBlue,
          activeColorSecondary: Colors.white,
          onPressed: ((p0) {}))
    ];
  }
}
