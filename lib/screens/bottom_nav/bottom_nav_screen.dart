import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:health_elev8_app/screens/home/home_view.dart';
import 'package:health_elev8_app/screens/profile/profile_screen.dart';

import '../blood_test_result/export.dart';
import 'export.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() =>
      _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = <Widget>[
    const HomeView(),
    const ResultsView(),
    const ReportView(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
       backgroundColor: AppColors.whiteColor,
        selectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.homeIcon,
              color: Colors.grey,
              width: 25,
              height: 25,
            ),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              AppAssets.homeIcon,
              color: AppColors.primaryColor,
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.resultIcon,
              color: Colors.grey,
              width: 25,
              height: 25,
            ),
            label: 'Result',
            activeIcon: SvgPicture.asset(
              AppAssets.resultIcon,
              color: AppColors.primaryColor,
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.reportIcon,
              color: Colors.grey,
              width: 25,
              height: 25,
            ),
            label: 'Tips',
            activeIcon: SvgPicture.asset(
              AppAssets.reportIcon,
              color: AppColors.primaryColor,
              width: 25,
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.profile_icon,
              color: Colors.grey,
              width: 25,
              height: 25,
            ),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              AppAssets.profile_icon,
              color: AppColors.primaryColor,
              width: 25,
              height: 25,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
