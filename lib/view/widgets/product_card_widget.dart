


import 'package:bazar/utils/app_colors.dart';
import 'package:bazar/utils/app_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardWidget extends StatelessWidget {

   ProductCardWidget({
   Key? key,required this.plasticNameText,
   required this.inStcokText,
   required this.productNameText,
   required this.productWeightText,
   required this.proudtPrictText,
   required this.productDiscountPriceText,
   required this.productImage
   }) : super(key: key);

   String plasticNameText;
   String inStcokText;
   String productNameText;
   String productWeightText;
   String proudtPrictText;
   String productDiscountPriceText;
   String productImage;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:AppColors.appWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 20,
            color: Color.fromRGBO(68, 68, 68, 0.05),
          ),
        ]
      ),

      child: Padding(
        padding:  EdgeInsets.only(left: 17.0.w,top: 16.h, right: 16.w,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            // Container(
            //   height: 38.h,
            //   width: 38.w,
            //   decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: AppColors.appBrandColor
            //
            //   ),
            //   child: Icon(Icons.add,color: AppColors.appWhiteColor,),
            //
            // ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 38.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.appBrandColor

                  ),
                  child: Icon(Icons.add,color: AppColors.appWhiteColor,),

                ),
                SizedBox(width: 5.w,),

                Container(
                  child: Stack(
                    children: [
                      Image.asset('assets/images/star.png',height: 50.h,width: 90.w,),
                     Positioned(
                       top: 12.h,
                       left: 20.w,
                       child: RotationTransition(
                          turns:AlwaysStoppedAnimation(20 / 360),
                          child: new Text("20% off"),
                        ),
                     )
                    ],
                  ),
                )

              ],
            ),


            //........image....................
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Image.asset(productImage,height: 100.h,width: 122.w,),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.appContainerColor,
                  borderRadius: BorderRadius.all(Radius.circular(4.r))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(plasticNameText.toUpperCase(),style: myStyleInter(12.sp, AppColors.appBlackColor,FontWeight.w700),),
                ),

              ),
            ),
            SizedBox(height: 6.h,),

            //...........stock
          Text(inStcokText.toUpperCase(), style: myStyleInter(12.sp, AppColors.appBrandColor, FontWeight.w700, -0.48)),
          SizedBox(height: 6.h,),

          //product Name..........
            Text(productNameText.toUpperCase(), style: myStyleInter(15.sp, AppColors.appBlackColor, FontWeight.w600, -0.32)),
            SizedBox(height: 6.h,),

            //product weight
            Text(productWeightText, style: myStyleInter(12.sp, AppColors.appGreyColor, FontWeight.w600, -0.24)),
            SizedBox(height: 6.h,),

            Row(
              children: [
                // product price
                Text(' ৳ ${proudtPrictText}'.toUpperCase(), style: myStyleInter(20.sp, AppColors.appBlackColor, FontWeight.w700, -0.32)),
                SizedBox(width: 10.w,),

                // product discount price
                Text('৳ ${productDiscountPriceText}'.toUpperCase(), style: TextStyle(fontSize:16.sp,color: AppColors.appBlackColor,fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough, decorationColor: Colors.red,)),
              ],
            )




      ],
        ),
      ),


    );
  }
}
