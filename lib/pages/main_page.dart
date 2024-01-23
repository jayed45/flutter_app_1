import 'package:flutter/material.dart';
import 'package:flutter_app_1/config/app_icons.dart';
import 'package:flutter_app_1/pages/home_page.dart';
import 'package:flutter_app_1/pages/profile_page.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icHome),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icFavorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icAdd),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icMessage),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.icUser),
            label: 'User',
          ),
        ],

        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },

        // showSelectedLabels: false,
        // showUnselectedLabels: false,
      ),
    );
  }

  final pages = [
    const HomePage(),
    const Center(
      child: Text('Favourite'),
    ),
    const Center(
      child: Text('Add Post'),
    ),
    const Center(
      child: Text('Messages'),
    ),
    const ProfilePage(),
  ];
}
