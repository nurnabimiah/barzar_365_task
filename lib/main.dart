import 'package:bazar/view/screens/bottom_nav_bar_screeen/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'di_container.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
              //primarySwatch: Colors.blue,
            ),
            initialRoute: NavBarScreen.routeName,
            getPages: [
              GetPage(name: NavBarScreen.routeName, page: () => NavBarScreen()),
            ],
          );
        }
    );
  }
}
