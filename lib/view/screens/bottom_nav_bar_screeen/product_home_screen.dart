



import 'package:bazar/utils/app_colors.dart';
import 'package:bazar/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../controller/product_controller.dart';
import '../../../utils/app_font_style.dart';
import '../../widgets/product_card_widget.dart';
import '../cart_screen/cart_screen.dart';




class ProductHomeScreen extends StatelessWidget {

  static const String routeName = '/product_home_route';
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(AppText.homeScreenAppbarText,style: myStyleInter(20.sp, AppColors.appBlackColor, FontWeight.w700, -0.48),),
      ),


      body: GetBuilder<ProductController>(
        builder: (controller) {
          return productController.productList.isNotEmpty? Column(
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.70,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount:controller. productList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final product = controller.productList[index];
                      final mango = controller.productList[0].image;
                      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$mango');
                      return Obx(() =>  ProductCardWidget(
                        index: index,
                        plasticNameText: product.isPlastic! ? product.plasticType?.name ?? 'Plastic free' : 'Plastic free',
                        inStcokText: product.isVisible! ? 'In Stock' : 'Stock Out',
                        productNameText: product.name!,
                        productWeightText: product.productWeight!,
                        proudtPrictText: product.price.toString(),
                        productDiscountPriceText: product.discountedAmount!.toString(),
                        productImage: product.image ??'',
                        discountSale: product.isDiscount! ? product.discountAmount.toString() : '',
                        isDiscount: product.isDiscount!,
                        isAddedToCart: productController.cartController.cartItems.any(
                              (item) => item.productId == product.id,
                        ),
                        addTocart: () {
                          productController.toggleCartState(index);
                          print('Item added to cart: ${product.name}');
                        },
                      ));

                    },
                  ),
                ),
              ),

            ],
          ):Center(child: CircularProgressIndicator());
        }
      ),


    );
  }
}

