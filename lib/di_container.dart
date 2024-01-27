


import 'package:bazar/controller/cart_controller.dart';
import 'package:bazar/data/repository/product_list_repo.dart';
import 'package:bazar/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/product_controller.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
final sl = GetIt.instance;

Future<void> init() async {


   /// Core
   sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

   //Repository
   sl.registerLazySingleton(() => ProductListRepo(dioClient: sl(), sharedPreferences: sl()));



   //Controller;
   Get.lazyPut(() => CartController(), fenix: true);
   Get.lazyPut(() => ProductController(productListRepo: sl()),fenix: true);




  // External pocket lock
   /// External pocket lock
   final sharedPreferences = await SharedPreferences.getInstance();
   sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => Dio());
   sl.registerLazySingleton(() => LoggingInterceptor());
}