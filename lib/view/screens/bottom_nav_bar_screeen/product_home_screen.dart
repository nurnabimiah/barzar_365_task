


import 'package:bazar/data/model/response_model/product_model.dart';
import 'package:bazar/utils/app_colors.dart';
import 'package:bazar/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_font_style.dart';
import '../../widgets/product_card_widget.dart';

class ProductHomeScreen extends StatelessWidget {
  static const String routeName = 'home_route';
  const ProductHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(AppText.homeScreenAppbarText,style: myStyleInter(20.sp, AppColors.appBlackColor, FontWeight.w700, -0.48),),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1/1.80,
                      crossAxisCount: 2,
                      crossAxisSpacing:8.w,
                      mainAxisSpacing: 8.h, ),
                  itemCount: productList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final product = productList[index];
                    return ProductCardWidget(
                      plasticNameText: product.isPlastic? '80G Plastic':'Plastic free',
                      inStcokText: product.inStock?'In Stock': 'Stock Out',
                      productNameText: product.productName,
                      productWeightText: product.productWeight,
                      proudtPrictText: product.productPrice,
                      productDiscountPriceText: product.productDiscount,
                      productImage: product.productImage,);
                  }),
            ),
          ),

        ],
      ),

    );
  }
}
