


import 'package:bazar/data/model/response_model/product_model.dart';
import 'package:bazar/utils/app_colors.dart';
import 'package:bazar/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../controller/product_controller.dart';
import '../../../data/model/response_model/product_model.dart';
import '../../../data/model/response_model/product_model.dart';
import '../../../utils/app_font_style.dart';
import '../../widgets/product_card_widget.dart';
import '../cart_screen/cart_screen.dart';
import 'menu_screen.dart';




class ProductHomeScreen extends StatelessWidget {

  final ProductController productController = Get.find<ProductController>();

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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.70,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: productList.length,
                itemBuilder: (BuildContext ctx, index) {
                  final product = productList[index];
                  return Obx(() =>  ProductCardWidget(
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
                    isAddedToCart: productController.cartController.cartItems.any(
                          (item) => item.productId == product.productId,
                    ),
                    addTocart: () {
                      productController.toggleCartState(index);
                      print('Item added to cart: ${product.productName}');
                    },
                  ));

                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(CartScreen());
            },
            child: Text('View Cart'),
          ),
        ],
      ),


    );
  }
}


// class ProductHomeScreen extends StatelessWidget {
//   final ProductController productController = Get.find<ProductController>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     print('Number of products in productList: ${productController.productList.length}');
//
//
//     return Scaffold(
//       backgroundColor: AppColors.appBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.appBackgroundColor,
//         title: Text(
//           AppText.homeScreenAppbarText,
//           style: myStyleInter(20.sp, AppColors.appBlackColor, FontWeight.w700, -0.48),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   childAspectRatio: 1 / 1.70,
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                 ),
//                 itemCount: productController.productList.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   final product = productController.productList[index];
//
//                   return ProductCardWidget(
//                     index: index,
//                     plasticNameText: product.isPlastic ? '80G Plastic' : 'Plastic free',
//                     inStcokText: product.isVisible ? 'In Stock' : 'Stock Out',
//                     productNameText: product.name,
//                     productWeightText: product.productWeight,
//                     proudtPrictText: product.price.toString(),
//                     productDiscountPriceText: product.discountAmount.toString(),
//                     productImage: product.image,
//                     discountSale: product.isDiscount ? '51% sale' : '',
//                     isDiscount: product.isDiscount,
//                     isAddedToCart: productController.cartController.cartItems.any(
//                           (item) => item.productId == product.id,
//                     ),
//                     addTocart: () {
//                       productController.toggleCartState(index);
//                       print('Item added to cart: ${product.name}');
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Get.to(CartScreen());
//             },
//             child: Text('View Cart'),
//           ),
//         ],
//       ),
//     );
//   }
// }

