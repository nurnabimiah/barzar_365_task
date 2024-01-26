


import 'package:bazar/data/model/response_model/product_model.dart';
import 'package:bazar/utils/app_colors.dart';
import 'package:bazar/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../utils/app_font_style.dart';
import '../../widgets/product_card_widget.dart';

// class ProductHomeScreen extends StatelessWidget {
//   static const String routeName = 'home_route';
//   const ProductHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.appBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.appBackgroundColor,
//         title: Text(AppText.homeScreenAppbarText,style: myStyleInter(20.sp, AppColors.appBlackColor, FontWeight.w700, -0.48),),
//       ),
//
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
//                       childAspectRatio: 1/1.80,
//                       crossAxisCount: 2,
//                       crossAxisSpacing:8.w,
//                       mainAxisSpacing: 8.h, ),
//                   itemCount: productList.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     final product = productList[index];
//                     return ProductCardWidget(
//                       plasticNameText: product.isPlastic? '80G Plastic':'Plastic free',
//                       inStcokText: product.inStock?'In Stock': 'Stock Out',
//                       productNameText: product.productName,
//                       productWeightText: product.productWeight,
//                       proudtPrictText: product.productPrice,
//                       productDiscountPriceText: product.productDiscount,
//                       productImage: product.productImage, discountSale: product.isDiscount? '51 % sale':'',
//                       isDiscount: product.isDiscount,
//                       addTocart: () {
//                         print('Item added to cart: ${product.productName}');
//                       },
//
//
//                     );
//                   }),
//             ),
//           ),
//
//         ],
//       ),
//
//     );
//   }
// }




/*
import 'package:get/get.dart'; // Import the get package

class ProductController extends GetxController {
  final isAddedToCart = <bool>[];

  void initializeCartState(int length) {
    isAddedToCart.assignAll(List.generate(length, (index) => false));
  }

  bool getCartState(int index) {
    if (index >= 0 && index < isAddedToCart.length) {
      return isAddedToCart[index];
    }
    return false;
  }

  void toggleCartState(int index) {
    if (index >= 0 && index < isAddedToCart.length) {
      isAddedToCart[index] = !isAddedToCart[index];
      update(); // Trigger a rebuild when the state changes
    }
  }
}



class ProductHomeScreen extends StatelessWidget {
  static const String routeName = 'home_route';
  final ProductController productController = Get.put(ProductController()); // Initialize your Getx Controller

  ProductHomeScreen({Key? key}) : super(key: key) {
    productController.initializeCartState(productList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(
          'Your App Bar Text',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.80,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: productList.length,
                itemBuilder: (BuildContext ctx, index) {
                  final product = productList[index];
                  return GetBuilder<ProductController>(
                    builder: (controller) => ProductCardWidget(
                      // Pass the index to identify the specific product
                      index: index,
                      plasticNameText: product.isPlastic ? '80G Plastic' : 'Plastic free',
                      inStcokText: product.inStock ? 'In Stock' : 'Stock Out',
                      productNameText: product.productName,
                      productWeightText: product.productWeight,
                      proudtPrictText: product.productPrice,
                      productDiscountPriceText: product.productDiscount,
                      productImage: product.productImage,
                      discountSale: product.isDiscount ? '51 % sale' : '',
                      isDiscount: product.isDiscount,
                      isAddedToCart: controller.isAddedToCart[index],
                      addTocart: () {
                        // Use the controller to toggle the state
                        controller.toggleCartState(index);
                        print('Item added to cart: ${product.productName}');
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
        padding: EdgeInsets.only(left: 17, top: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: addTocart,
                  child: Container(
                    height: isAddedToCart ? 20 : 38,
                    width: isAddedToCart ? 50 : 38,
                    decoration: BoxDecoration(
                      shape: isAddedToCart ? BoxShape.rectangle : BoxShape.circle,
                      color: AppColors.appBrandColor,
                    ),
                    child: isAddedToCart
                        ? Center(
                      child: Text(
                        'Added',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    )
                        : Icon(Icons.add, color: Colors.white),
                  ),
                ),
                isDiscount
                    ? Container(
                  child: Stack(
                    children: [
                      Image.asset('assets/images/star.png', height: 50, width: 90),
                      Positioned(
                        top: 12,
                        left: 20,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(20 / 360),
                          child: Text(discountSale),
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
                    style: TextStyle(fontSize: 12, color: AppColors.appBlackColor, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              inStcokText.toUpperCase(),
              style: TextStyle(fontSize: 12, color: AppColors.appBrandColor, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 6),
            Text(
              productNameText.toUpperCase(),
              style: TextStyle(fontSize: 15, color: AppColors.appBlackColor, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              productWeightText,
              style: TextStyle(fontSize: 12, color: AppColors.appGreyColor, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Text(
                  ' ৳ $proudtPrictText'.toUpperCase(),
                  style: TextStyle(fontSize: 20, color: AppColors.appBlackColor, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 10),
                Text(
                  '৳ $productDiscountPriceText'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.appBlackColor,
                    fontWeight: FontWeight.w400,
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
}*/






