




import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';





class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;
  final SharedPreferences prefs = Get.find();

  @override
  void onInit() {
    super.onInit();
    List<String>? storedItems = prefs.getStringList('cartItems');
    if (storedItems != null) {
      cartItems.assignAll(storedItems.map((item) => CartItem.fromJson(jsonDecode(item))).toList());
    }
  }

  Future<void> addToCart(CartItem item) async {
    if (cartItems.any((existingItem) => existingItem.productId == item.productId)) {
      final existingItemIndex = cartItems.indexWhere((existingItem) => existingItem.productId == item.productId);
      cartItems[existingItemIndex].quantity++;
    } else {
      cartItems.add(item);
    }
    update();
    await saveCartToStorage();
  }


  Future<void> removeFromCart(CartItem item) async {
    if (item.quantity > 1) {
      final existingItemIndex = cartItems.indexWhere((existingItem) => existingItem.productId == item.productId);
      cartItems[existingItemIndex].quantity--;
    } else {
      cartItems.remove(item);
    }
    update(); // Notify observers and update the UI
    await saveCartToStorage();
  }


  Future<void> saveCartToStorage() async {
    List<String> jsonList = cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cartItems', jsonList);
  }
}


class CartItem {
  final String productId;
  final String productName;
  final String productImage;
  int quantity;

  CartItem({
    required this.productId,
    required this.productName,
    required this.productImage,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId':productId,
      'productName': productName,
      'productImage': productImage,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId:json['productId'],
      productName: json['productName'],
      productImage: json['productImage'],
      quantity: json['quantity'],
    );
  }
}