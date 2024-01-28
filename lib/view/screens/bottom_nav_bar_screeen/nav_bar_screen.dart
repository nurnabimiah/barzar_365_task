

import 'package:bazar/view/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/bottom_navbar_controller.dart';
import '../../../utils/app_colors.dart';


class BottomNavBar extends StatelessWidget {
  static const String routeName = '/nav_bar_route';

  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (controller) => Scaffold(

        body: controller.currentScreen,

        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: Container(

            height: 30.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[

                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        color: controller.selectedIndex == 0 ? AppColors.appBrandColor // Selected color
                            : AppColors.appGreyColor, size: 24.sp,
                      ),

                      onPressed: () => controller.changeScreen(0),
                    ),
                    SizedBox(width: 20.w,),
                    IconButton(
                      icon: Icon(
                        Icons.category_sharp,
                        color: controller.selectedIndex == 1 ? AppColors.appBrandColor // Selected color
                            : AppColors.appGreyColor, size: 24.sp,
                      ),

                      onPressed: () => controller.changeScreen(1),
                    ),
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: controller.selectedIndex == 2 ? AppColors.appBrandColor // Selected color
                            : AppColors.appGreyColor, size: 24.sp,
                      ),

                      onPressed: () => controller.changeScreen(2),
                    ),
                    SizedBox(width: 20.w,),
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: controller.selectedIndex == 3 ? AppColors.appBrandColor // Selected color
                            : AppColors.appGreyColor, size: 24.sp,
                      ),

                      onPressed: () => controller.changeScreen(3),
                    ),
                  ],
                )








              ],
            ),
          ),
        ),

        floatingActionButton: Obx(()=>GestureDetector(
          onTap: (){
            Get.toNamed(CartScreen.routeName);
          },
          child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                  color: AppColors.appBrandColor,
                  shape: BoxShape.circle
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.0.h,left:4.w),
                    child: Container(
                        height: 15.h,
                        width: 15.w,
                        decoration: BoxDecoration(color:AppColors.appWhiteColor,shape: BoxShape.circle),
                        child: Center(child: Text('${controller.cartController.cartItems.length}',style: TextStyle(color: AppColors.appBlackColor,fontSize: 8.sp),))),
                  ),
                  Icon(Icons.shopping_cart,size: 18.sp,color: AppColors.appWhiteColor,),
                ],
              )
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

}