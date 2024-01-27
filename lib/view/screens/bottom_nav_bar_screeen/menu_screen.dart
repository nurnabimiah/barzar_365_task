


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






class ProductHomeScreen extends StatelessWidget {
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
}

// product_card_widget.dart
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
        color: Colors.white,
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
                      color: Colors.blue,
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
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    plasticNameText.toUpperCase(),
                    style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              inStcokText.toUpperCase(),
              style: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 6),
            Text(
              productNameText.toUpperCase(),
              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Text(
              productWeightText,
              style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Text(
                  ' ৳ $proudtPrictText'.toUpperCase(),
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 10),
                Text(
                  '৳ $productDiscountPriceText'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
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
}








