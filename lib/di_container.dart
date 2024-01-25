


import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
final sl = GetIt.instance;

Future<void> init() async {

  /// Controller
  // Get.lazyPut(() => OnboardingController(), fenix: true);
  // Get.lazyPut(() => TaskController(), fenix: true);
  // Get.lazyPut(() => SplashController(), fenix: true);



  /// External pocket lock
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => Dio());
}