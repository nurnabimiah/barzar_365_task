import 'package:bazar/view/screens/bottom_nav_bar_screeen/category_screen.dart';
import 'package:bazar/view/screens/bottom_nav_bar_screeen/menu_screen.dart';
import 'package:bazar/view/screens/bottom_nav_bar_screeen/nav_bar_screen.dart';
import 'package:bazar/view/screens/bottom_nav_bar_screeen/product_home_screen.dart';
import 'package:bazar/view/screens/bottom_nav_bar_screeen/search_screen.dart';
import 'package:bazar/view/screens/cart_screen/cart_screen.dart';
import 'package:bazar/view/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di_container.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Get.put<SharedPreferences>(await SharedPreferences.getInstance());

  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context,child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bazar 365',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent,
                  elevation: 0
              ),
              useMaterial3: true,

            ),
            initialRoute: BottomNavBar.routeName,
             getPages: [
            GetPage(name: BottomNavBar.routeName, page: () => BottomNavBar()),
            GetPage(name: ProductHomeScreen.routeName, page: () => ProductHomeScreen()),
            GetPage(name: CategoryScreen.routeName, page: () => CategoryScreen()),
            GetPage(name:SearchScreen.routeName, page: () => SearchScreen()),
            GetPage(name:CartScreen.routeName, page: () => CartScreen()),
            ],
          );
        }
    );
  }
}
