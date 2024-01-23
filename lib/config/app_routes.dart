import 'package:flutter_app_1/pages/edit_profile_page.dart';
import 'package:flutter_app_1/pages/home_page.dart';
import 'package:flutter_app_1/pages/login_page.dart';
import 'package:flutter_app_1/pages/main_page.dart';
import 'package:flutter_app_1/pages/nearby_page.dart';

class AppRoutes {
  static final pages = {
    login: (context) => LoginPage(),
    home: (context) => const HomePage(),
    main: (context) => const MainPage(),
    editProfile: (context) => const EditProfilePage(),
    nearby: (context) => const NearbyPage(),
  };

  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit_profile';
  static const nearby = '/nearby';
  static const user = '/user';
}
