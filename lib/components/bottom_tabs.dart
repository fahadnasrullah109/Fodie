import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodei/presentation/dashboard/history/history_screen.dart';
import 'package:fodei/presentation/dashboard/home/home_screen.dart';
import 'package:fodei/presentation/dashboard/profile/profile_screen.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final SvgPicture selectedIcon;
  final SvgPicture unSelectedIcon;

  TabNavigationItem(
      {required this.page,
      required this.title,
      required this.selectedIcon,
      required this.unSelectedIcon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomeScreen(),
          title: 'Home',
          unSelectedIcon:
              SvgPicture.asset('assets/images/ic_home_unselected.svg'),
          selectedIcon: SvgPicture.asset('assets/images/ic_home_selected.svg'),
        ),
        TabNavigationItem(
          page: const HistoryScreen(),
          title: 'History',
          unSelectedIcon:
              SvgPicture.asset('assets/images/ic_history_unselected.svg'),
          selectedIcon:
              SvgPicture.asset('assets/images/ic_history_selected.svg'),
        ),
        TabNavigationItem(
          page: const ProfileScreen(),
          title: 'Profile',
          unSelectedIcon:
              SvgPicture.asset('assets/images/ic_profile_unselected.svg'),
          selectedIcon:
              SvgPicture.asset('assets/images/ic_profile_selected.svg'),
        ),
      ];
}
