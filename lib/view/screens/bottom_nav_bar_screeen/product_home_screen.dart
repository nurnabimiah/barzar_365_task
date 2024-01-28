



import 'package:bazar/utils/app_colors.dart';
import 'package:bazar/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/product_controller.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/icon_container.dart';
import '../../widgets/product_card_widget.dart';









class ProductHomeScreen extends StatefulWidget {
  static const String routeName = '/product_home_route';

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {


  final ProductController productController = Get.find<ProductController>();
  String? selectedStatus;
  String? numberSelectedValue;

  void sortProductList() {
    if (selectedStatus == 'Product Name') {
      productController.productList.sort((a, b) => a.name!.compareTo(b.name!));
    } else if (selectedStatus == 'Price') {
      productController.productList.sort((a, b) => a.price!.compareTo(b.price!));
    } else if (selectedStatus == 'Position') {
      productController.productList.sort((a, b) => a.id.compareTo(b.id));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        title: Text(
          AppText.homeScreenAppbarText,
          style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700, letterSpacing: -0.48),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Row(
              children: [
                IconContainer(iconData: Icons.opacity_sharp, onTap: () {}),
                SizedBox(width: 15),
                IconContainer(iconData: Icons.favorite_border, onTap: () {}),
              ],
            ),
          ),
        ],
      ),


      body: GetBuilder<ProductController>(
        builder: (controller) {
          // Call the sorting function when the productList is not empty and sorting option is selected
          if (controller.productList.isNotEmpty && selectedStatus != null) {
            sortProductList();
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          items: ['Position', 'Product Name', 'Price'],
                          selectedValue: selectedStatus,
                          onChanged: (String? value) {
                            setState(() {
                              selectedStatus = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 7),
                      // ... your existing code for sorting UI
                      Expanded(
                        child: CustomDropdown(
                          items: ['15', '30', '60'],
                          selectedValue: numberSelectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              numberSelectedValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              controller.productList.isNotEmpty?Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.70,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: controller?.productList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      final product = controller.productList[index];
                      return Obx(() => ProductCardWidget(
                        index: index,
                        plasticNameText: product.isPlastic! ? product.plasticType?.name ?? 'Plastic free' : 'Plastic free',
                        inStcokText: product.isVisible! ? 'In Stock' : 'Stock Out',
                        productNameText: product.name!,
                        productWeightText: product.productWeight!,
                        proudtPrictText: product.price.toString(),
                        productDiscountPriceText: product.discountedAmount!.toString(),
                        productImage: 'assets/images/apple.png',
                        discountSale: product.isDiscount! ? product.discountAmount.toString() : '',
                        isDiscount: product.isDiscount!,
                        isAddedToCart: productController.cartController.cartItems.any(
                              (item) => item.productId == product.id,
                        ),
                        addTocart: () {
                          productController.toggleCartState(index);
                          print('Item added to cart: ${product.name}');
                        },
                      ));
                    },
                  ),
                ),
              ):Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}