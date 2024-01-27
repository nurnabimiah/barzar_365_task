


import 'package:bazar/utils/app_colors.dart';
import 'package:bazar/utils/app_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




///right code

// class ProductCardWidget extends StatefulWidget {
//
//   ProductCardWidget({
//     Key? key,required this.plasticNameText,
//     required this.inStcokText,
//     required this.productNameText,
//     required this.productWeightText,
//     required this.proudtPrictText,
//     required this.productDiscountPriceText,
//     required this.productImage,
//     required this.discountSale,
//     required this.isDiscount,
//     required this.addTocart
//   }) : super(key: key);
//
//   String plasticNameText;
//   String inStcokText;
//   String productNameText;
//   String productWeightText;
//   String proudtPrictText;
//   String productDiscountPriceText;
//   String productImage;
//   String discountSale;
//   bool isDiscount;
//   void Function()? addTocart;
//
//   @override
//   State<ProductCardWidget> createState() => _ProductCardWidgetState();
// }
//
// class _ProductCardWidgetState extends State<ProductCardWidget> {
//   bool isAddedToCart = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color:AppColors.appWhiteColor,
//           borderRadius: BorderRadius.all(Radius.circular(8.r)),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 5),
//               blurRadius: 20,
//               color: Color.fromRGBO(68, 68, 68, 0.05),
//             ),
//           ]
//       ),
//
//       child: Padding(
//         padding:  EdgeInsets.only(left: 17.0.w,top: 16.h, right: 16.w,),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap:(){
//                     widget.addTocart?.call();
//                     setState(() {
//                       isAddedToCart = !isAddedToCart;
//                     });
//                   },
//                   child: Container(
//                     height:isAddedToCart?20.h: 38.h,
//                     width: isAddedToCart?50.h:38.w,
//                     decoration: BoxDecoration(
//                       shape: isAddedToCart?BoxShape.rectangle:BoxShape.circle,
//                       color: AppColors.appBrandColor // Change color as needed
//                     ),
//                     child: isAddedToCart ? Center(child: Text('Added', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12.sp),),)
//                         : Icon(Icons.add, color: Colors.white),
//                   ),
//                 ),
//                 widget.isDiscount?Container(child: Stack(
//                   children: [
//                     Image.asset('assets/images/star.png', height: 50.h, width: 90.w,),
//                     Positioned(
//                       top: 12.h,
//                       left: 20.w,
//                       child: RotationTransition(
//                         turns: AlwaysStoppedAnimation(20 / 360),
//                         child: Text(widget.discountSale),
//                       ),
//                     ),
//                   ],
//                 ),):SizedBox.shrink(),
//
//
//               ],
//             ),
//
//
//             Padding(
//               padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
//               child: Image.asset(widget.productImage,height: 100.h,width: 122.w,),
//             ),
//
//             Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.appContainerColor,
//                     borderRadius: BorderRadius.all(Radius.circular(4.r))
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Text(widget.plasticNameText.toUpperCase(),style: myStyleInter(12.sp, AppColors.appBlackColor,FontWeight.w700),),
//                 ),
//
//               ),
//             ),
//             SizedBox(height: 6.h,),
//
//             //...........stock
//             Text(widget.inStcokText.toUpperCase(), style: myStyleInter(12.sp, AppColors.appBrandColor, FontWeight.w700, -0.48)),
//             SizedBox(height: 6.h,),
//
//             //product Name..........
//             Text(widget.productNameText.toUpperCase(), style: myStyleInter(15.sp, AppColors.appBlackColor, FontWeight.w600, -0.32)),
//             SizedBox(height: 6.h,),
//
//             //product weight
//             Text(widget.productWeightText, style: myStyleInter(12.sp, AppColors.appGreyColor, FontWeight.w600, -0.24)),
//             SizedBox(height: 6.h,),
//
//             Row(
//               children: [
//                 // product price
//                 Text(' ৳ ${widget.proudtPrictText}'.toUpperCase(), style: myStyleInter(20.sp, AppColors.appBlackColor, FontWeight.w700, -0.32)),
//                 SizedBox(width: 10.w,),
//
//                 // product discount price
//                 Text('৳ ${widget.productDiscountPriceText}'.toUpperCase(), style: TextStyle(fontSize:16.sp,color: AppColors.appBlackColor,fontWeight: FontWeight.w400,
//                   decoration: TextDecoration.lineThrough, decorationColor: Colors.red,)),
//               ],
//             )
//
//
//
//
//           ],
//         ),
//       ),
//
//
//     );
//   }
// }




class ProductCardWidget extends StatelessWidget {
  final int index;
  final String plasticNameText;
  final String inStcokText;
  final String productNameText;
  final String productWeightText;
  final String proudtPrictText;
  final String productDiscountPriceText;
  final String productImage;
  final String discountSale;
  final bool isDiscount;
  final bool isAddedToCart;
  final void Function()? addTocart;

  ProductCardWidget({
    Key? key,
    required this.index,
    required this.plasticNameText,
    required this.inStcokText,
    required this.productNameText,
    required this.productWeightText,
    required this.proudtPrictText,
    required this.productDiscountPriceText,
    required this.productImage,
    required this.discountSale,
    required this.isDiscount,
    required this.isAddedToCart,
    required this.addTocart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 20,
            color: Color.fromRGBO(68, 68, 68, 0.05),
          ),
        ],
      ),

      child: Padding(
        padding: EdgeInsets.only(left: 17.w, top: 16.h, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //.........add to cart and discount ...........................
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //.........add to cart button...........
                GestureDetector(
                  onTap: addTocart,
                  child: Container(
                    height: isAddedToCart ? 22 : 35,
                    width: isAddedToCart ? 50 : 35,
                    decoration: BoxDecoration(
                      shape: isAddedToCart ? BoxShape.rectangle : BoxShape.circle,
                      color: AppColors.appBrandColor,
                    ),
                    child: isAddedToCart ? Center(child: Text('Added', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10.sp,),),)
                        : Icon(Icons.add, color: Colors.white),
                  ),
                ),

                //........discount value.........
                isDiscount ? Container(
                  child: Stack(
                    children: [
                      Image.asset('assets/images/star.png', height: 50.h, width: 90.w),
                      Positioned(
                        top: 13.h,
                        left: 20.w,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(20 / 360),
                          child: Text(discountSale,style: myStyleInter(12.sp,AppColors.appWhiteColor,FontWeight.w600),),
                        ),
                      ),
                    ],
                  ),
                )
                    : SizedBox.shrink(),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(productImage, height: 100, width: 122),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.appContainerColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    plasticNameText.toUpperCase(),
                    style: myStyleInter( 10.sp,  AppColors.appBlackColor, FontWeight.w700,-0.33),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6.h),

            //........in stock text...............
            Text(
              inStcokText.toUpperCase(),
              style: myStyleInter( 12.sp,  AppColors.appBrandColor, FontWeight.w700,-0.48),
            ),
            SizedBox(height: 6.h),


            //........product name................................
            Text(
              productNameText.toUpperCase(),
              style: myStyleInter( 14.sp,  AppColors.appBlackColor, FontWeight.w600,-0.33),
            ),
            SizedBox(height: 6.h),


            //.........product weight................
            Text(
              productWeightText,
              style: myStyleInter( 10.sp,  AppColors.appGreyColor, FontWeight.w600,-0.33),),
            SizedBox(height: 6.h),


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ৳ $proudtPrictText '.toUpperCase(),
                  style: myStyleInter( 18.sp,  AppColors.appBlackColor, FontWeight.w700,-0.33),
                ),
                SizedBox(width: 10),
                Text(
                  '৳ $productDiscountPriceText'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color:AppColors.appBrandColor,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



