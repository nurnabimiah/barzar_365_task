




import 'package:bazar/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/cart_controller.dart';
import '../../../utils/app_font_style.dart';
import '../../widgets/animated_alert_dialouge.dart';
import '../../widgets/task_progress_container.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart_route';
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final CartController cartController1 = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: GetBuilder<CartController>(
          builder: (cartController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 50.h,),

                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back_ios)),



                Padding(
                  padding: EdgeInsets.only(left:16.0.w,right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shopping Cart (${cartController.cartItems.length})",style: myStyleInter(18.sp,AppColors.appBlackColor,FontWeight.w700,-0.48)),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Text("Add items worth",style: myStyleInter(14.sp,AppColors.appBlackColor,FontWeight.w600,-0.48)),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("Tk 30",style: myStyleInter(14.sp,AppColors.appBrandColor,FontWeight.w800,-0.48)),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("for free shopping",style: myStyleInter(14.sp,AppColors.appBlackColor,FontWeight.w600,-0.48)),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      LinearPercentIndicator(
                        width: 320,
                        lineHeight: 10.0.h,
                        percent: 0.50,
                        animation: true,
                        backgroundColor: AppColors.appGreyColor,
                        progressColor: AppColors.appBrandColor,
                        animationDuration: 2000,
                        linearStrokeCap: LinearStrokeCap.round,
                        barRadius: Radius.circular(5),
                      ),
                      SizedBox(height: 20.h,),


                      Text("Added Item ${cartController.cartItems.length} items",style: myStyleInter(18.sp,AppColors.appBlackColor,FontWeight.w700,-0.48)),
                    ],
                  ),
                ),

                //........cart items............
                Expanded(
                  child: ListView.separated(
                    itemCount: cartController.cartItems.length,
                    separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 30.h,),
                    itemBuilder: (BuildContext ctx, index) {
                      final cartItem = cartController.cartItems[index];
                      return  Padding(
                        padding:  EdgeInsets.only(left: 12.0.w,right: 12.w),
                        child: Container(
                          child: Row(
                            children: [
                              Expanded(
                                  flex:1,
                                  child: Image.asset('assets/images/apple.png', height: 50, width: 50)),

                              SizedBox(width: 10.w,),
                              Expanded(
                                  flex:4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItem.productName,
                                              maxLines: 2, // Set the maximum number of lines
                                              overflow: TextOverflow.ellipsis, // Display ellipsis (...) for overflow
                                              style: myStyleInter(14.sp, AppColors.appBlackColor, FontWeight.w600, -0.33),
                                            ),
                                            SizedBox(height: 10.h,),
                                            Container(
                                              width: 120.w,
                                              height: 37.h,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black),
                                                  borderRadius: BorderRadius.all(Radius.circular(12.r))

                                              ),
                                              child: Row(
                                                children: [
                                                        IconButton(
                                                          icon: Icon(Icons.remove,size: 18.sp,),
                                                          onPressed: () async {
                                                            await cartController.removeFromCart(cartItem);
                                                          },
                                                        ),

                                                       Text(' ${cartItem.quantity}',style: myStyleInter(12.sp, AppColors.appBlackColor,FontWeight.w600),),

                                                        IconButton(
                                                          icon: Icon(Icons.add,size: 18.sp,),
                                                          onPressed: () async {
                                                            await cartController.addToCart(cartItem);
                                                          },
                                                        ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [

                                            Text(
                                             " ৳ ${cartItem.productPrice.toString()}",
                                              maxLines: 1, // Set the maximum number of lines
                                              overflow: TextOverflow.ellipsis, // Display ellipsis (...) for overflow
                                              style: myStyleInter(14.sp, AppColors.appBlackColor, FontWeight.w800, -0.33),
                                            ),

                                            SizedBox(height: 25.h,),
                                            IconButton(
                                              onPressed: () async {
                                                // Show an alert dialog when the delete icon is pressed
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text("Confirm Deletion"),
                                                      content: Text("Are you sure you want to delete this item from the cart?"),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pop(); // Close the dialog
                                                          },
                                                          child: Text("Cancel"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            await cartController.deleteCartItem(cartItem);
                                                            Navigator.of(context).pop(); // Close the dialog after deletion
                                                          },
                                                          child: Text("Delete"),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(Icons.delete, color: Color(0XFFEB5757)),
                                            ),




                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      );

                    },
                  )
                ),

                //.......................checkout............................
                Container(
                  color: AppColors.appWhiteColor,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 12.0.h, bottom: 12.h,left: 16.w,right: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",style: myStyleInter(16.sp,AppColors.appBlackColor,FontWeight.w700,-0.48)),
                            Text("${cartController.getOverallTotal()}",style: myStyleInter(16.sp,AppColors.appBlackColor,FontWeight.w700,-0.48)),
                          ],
                        ),

                        SizedBox(height: 10.h,),


                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: 45.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              color: AppColors.appBrandColor,
                            ),

                            child: Center(child: Text('Checkout',style: myStyleInter(14.sp,AppColors.appWhiteColor,FontWeight.w700),)),

                          ),
                        )

                      ],
                    ),
                  ),
                )




              ],
            );
          }
      ),
    );
  }
}

