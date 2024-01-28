
import 'package:bazar/view/screens/bottom_nav_bar_screeen/menu_screen.dart';
import 'package:bazar/view/screens/bottom_nav_bar_screeen/product_home_screen.dart';
import 'package:bazar/view/screens/bottom_nav_bar_screeen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/bottom_nav_bar_screeen/category_screen.dart';



class BottomNavController extends GetxController {
  int selectedIndex = 0;
  List<String> titles = ['Home', 'Dictionary', 'Translate'];
  List<Widget> screens = [
    ProductHomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    MenuScreen()
  ];

  String get title => titles[selectedIndex];
  Widget get currentScreen => screens[selectedIndex];

  void changeScreen(int index) {
    selectedIndex = index;
    update();
  }
}