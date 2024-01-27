


import 'package:bazar/data/model/response_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';



import '../../../controller/cart_controller.dart';
import '../../../controller/product_controller.dart';
import '../../../utils/app_font_style.dart';
import '../../widgets/product_card_widget.dart';
import '../cart_screen/cart_screen.dart';






/*class ProductHomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
}*/

//product_card_widget.dart









