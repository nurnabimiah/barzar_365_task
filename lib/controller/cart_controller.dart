




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

  // delete cart item....................
  Future<void> deleteCartItem(CartItem cartItem) async {
    final existingItemIndex = cartItems.indexWhere((existingItem) => existingItem.productId == cartItem.productId);
    if (existingItemIndex != -1) {
      cartItems.removeAt(existingItemIndex);
      update(); // Notify observers and update the UI
      await saveCartToStorage();
    }
  }

  dynamic getItemSubtotal(CartItem item) {
    return (item.quantity * item.productPrice);
  }

  dynamic getOverallTotal() {
    return cartItems.fold(0.0, (total, item) => total + getItemSubtotal(item));
  }

  Future<void> saveCartToStorage() async {
    List<String> jsonList = cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cartItems', jsonList);
  }

}



class CartItem {
  final String productId;
  final dynamic productPrice;
  final String productName;
  final String productImage;
  int quantity;

  CartItem({
    required this.productId,
    required this.productPrice,
    required this.productName,
    required this.productImage,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId':productId,
      'productPrice':productPrice,
      'productName': productName,
      'productImage': productImage,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId:json['productId'],
      productPrice:json['productPrice'],
      productName: json['productName'],
      productImage: json['productImage'],
      quantity: json['quantity'],
    );
  }
}