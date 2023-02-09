import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workshop_project/presentation/Constants/appColor.dart';
import 'package:workshop_project/presentation/screens/home/home.dart';
import 'package:workshop_project/presentation/screens/news/news.dart';
import 'package:workshop_project/presentation/screens/setting/settings.dart';
import 'package:workshop_project/presentation/widget/default_text.dart';




class PageLayout extends StatefulWidget {
  const PageLayout({Key? key}) : super(key: key);

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  List _screens = [HomeScreen(), NewsScreen(), SettingScreen()];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                  icon: SvgPicture.asset('assets/assets/icons/home.svg'),
                  title: DefaultText(text: 'Home'),
                  inactiveColor: Colors.black,
                  textAlign: TextAlign.center,
                  activeColor: AppColors.primaryColor
              ),
              BottomNavyBarItem(
                  icon: const Icon(Icons.newspaper_outlined),
                  title: DefaultText(text: 'News'),
                  textAlign: TextAlign.center,
                  inactiveColor: AppColors.primaryColor,
                  activeColor: AppColors.primaryColor
              ),
              BottomNavyBarItem(
                  icon: SvgPicture.asset('assets/assets/icons/settings.svg'),
                  title: DefaultText(text: 'Settings'),
                  inactiveColor: Colors.black,
                  textAlign: TextAlign.center,
                  activeColor: AppColors.primaryColor
              ),
            ],
            onItemSelected: (index) => setState(() {
              _currentIndex = index;
            })));
  }
}
