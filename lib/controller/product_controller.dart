



import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/model/response_model/product_model.dart';
import 'cart_controller.dart';

class ProductController extends GetxController {

  final CartController cartController = Get.put(CartController());

  void toggleCartState(int index) {
    bool isInCart = cartController.cartItems.any((item) => item.productId == productList[index].productId);
    if (isInCart) {
      removeFromCart(index);
    } else {
      addToCart(index);
    }
    cartController.saveCartToStorage();
    update();
  }



  void addToCart(int index) {
    cartController.cartItems.add(
      CartItem(
        productId: productList[index].productId,
        productName: productList[index].productName,
        productImage: productList[index].productImage,
      ),
    );
  }

  void removeFromCart(int index) {
    String productId = productList[index].productId;
    cartController.cartItems.removeWhere((item) => item.productId == productId);
  }



}