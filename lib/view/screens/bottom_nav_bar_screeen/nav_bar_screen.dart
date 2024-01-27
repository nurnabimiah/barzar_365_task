

import 'package:flutter/material.dart';

// class NavBarScreen extends StatelessWidget {
//   static const String routeName = 'navbar_route';
//   const NavBarScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/product_controller.dart';
//
// class ProductListPage extends StatelessWidget {
//   final ProductController productController = Get.find<ProductController>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${productController.productList.length}');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: Obx(
//             () => productController.isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//           itemCount: productController.productList.length,
//           itemBuilder: (context, index) {
//             final product = productController.productList[index];
//
//             return ListTile(
//               title: Text(product.name),
//               subtitle: Text('Price: \$${product.price}'),
//               onTap: () {
//                 // You can navigate to a detailed product page or perform other actions here
//               },
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.toNamed('/cart'); // Navigate to the cart page
//         },
//         child: Icon(Icons.shopping_cart),
//       ),
//     );
//   }
// }
