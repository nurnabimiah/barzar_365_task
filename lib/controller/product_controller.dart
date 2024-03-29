



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

  @override
  void onInit() {
    getAllProductsList();
    super.onInit();
  }




  //.............get all product list from product list repo.....................

  // Future<void> getAllProductsList() async {
  //   isLoading = true;
  //   update();
  //   ApiResponse apiResponse = await productListRepo.getAllProductList();
  //
  //   if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
  //     isLoading = false;
  //     if (apiResponse.response!.data != null) {
  //       if (apiResponse.response!.data is List) {
  //         // Handle the list data appropriately (e.g., store it or process it)
  //         // Example: Assign the list directly to productList
  //         productList = List<ProductListModel>.from(apiResponse.response!.data.map((item) => ProductListModel.fromJson(item)));
  //       } else {
  //
  //         try {
  //           List<ProductListModel> parsedList = productListFromJson(apiResponse.response!.data!);
  //           productList = parsedList;
  //         } catch (e) {
  //           // Handle parsing error, if any
  //           print("Error parsing JSON: $e");
  //         }
  //       }
  //     }
  //     update();
  //   } else {
  //     isLoading = false;
  //     update();
  //   }
  // }


  Future<void> getAllProductsList() async {
    isLoading = true;
    update();
    ApiResponse apiResponse = await productListRepo.getAllProductList();

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      isLoading = false;

      if (apiResponse.response!.data != null) {
        dynamic responseData = apiResponse.response!.data;

        if (responseData is List) {
          // Handle the list data appropriately (e.g., store it or process it)
          // Example: Assign the list directly to productList
          productList = List<ProductListModel>.from(responseData.map((item) => ProductListModel.fromJson(item)));
        } else {
          try {
            List<ProductListModel> parsedList = productListFromJson(responseData!);
            productList = parsedList;
          } catch (e) {
            // Handle parsing error, if any
            print("Error parsing JSON: $e");
          }
        }
      }

      update();
    } else {
      isLoading = false;
      update();
    }
  }





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

  void addToCart(int index) {
    String? productId = productList[index].id;
    if (productId != null) {
      cartController.cartItems.add(
        CartItem(
          productId: productId,
          productName: productList[index].name ?? '',
          productImage: productList[index].image ?? '',
          productPrice: productList[index].price ,
        ),
      );
    }
  }

  void removeFromCart(int index) {
    String? productId = productList[index].id;
    if (productId != null) {
      cartController.cartItems.removeWhere((item) => item.productId == productId);
    }
  }


}
