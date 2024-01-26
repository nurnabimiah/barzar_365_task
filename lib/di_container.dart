


import 'package:bazar/controller/cart_controller.dart';
import 'package:bazar/view/screens/bottom_nav_bar_screeen/menu_screen.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.instance;

Future<void> init() async {

   //Controller
   // Get.lazyPut(() => CartController(), fenix: true);
   Get.lazyPut(() => CartController(), fenix: true);
  // Get.lazyPut(() => SplashController(), fenix: true);



  /// External pocket lock
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => Dio());
}