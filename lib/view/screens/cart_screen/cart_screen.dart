




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/cart_controller.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController1 = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: GetBuilder<CartController>(
          builder: (cartController) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final cartItem = cartController.cartItems[index];
                      return ListTile(
                        leading: Image.asset(cartItem.productImage, height: 50, width: 50),
                        title: Text(cartItem.productName),
                        subtitle: Text('Quantity: ${cartItem.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () async {
                                await cartController.removeFromCart(cartItem);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () async {
                                await cartController.addToCart(cartItem);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Go Back'),
                ),
              ],
            );
          }
      ),
    );
  }
}