



import 'package:bazar/data/model/response_model/product_list_model.dart';
import 'package:bazar/data/repository/product_list_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/model/base_model/api_response.dart';

import 'cart_controller.dart';

class ProductController extends GetxController {

  final ProductListRepo productListRepo;
  ProductController({required this.productListRepo});

  bool isLoading = false;
  String? message;
  String? success;
  ProductListModel? productListModel;

  List<ProductListModel> productList = [];






  final CartController cartController = Get.put(CartController());

  void toggleCartState(int index) {
    bool isInCart = cartController.cartItems.any((item) => item.productId == productList[index].id);
    if (isInCart) {
      removeFromCart(index);
    } else {
      addToCart(index);
    }
    cartController.saveCartToStorage();
    update();
  }


  //
  // void addToCart(int index) {
  //   cartController.cartItems.add(
  //     CartItem(
  //       productId: productList[index].productId,
  //       productName: productList[index].productName,
  //       productImage: productList[index].productImage,
  //     ),
  //   );
  // }
  //
  // void removeFromCart(int index) {
  //   String productId = productList[index].productId;
  //   cartController.cartItems.removeWhere((item) => item.productId == productId);
  // }



  void addToCart(int index) {
    cartController.cartItems.add(
      CartItem(
        productId: productList[index].id,
        productName: productList[index].name,
        productImage: productList[index].image,
      ),
    );
  }

  void removeFromCart(int index) {
    String productId = productList[index].id;
    cartController.cartItems.removeWhere((item) => item.productId == productId);
  }



}






