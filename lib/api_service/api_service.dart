




import 'package:dio/dio.dart';

import '../data/model/response_model/product_list_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<ProductListModel>> fetchProductList(void Function(int length) onProductListLength) async {
    try {
      final response = await _dio.get('https://backend-test.bazar365.com/api/productGroup/products');
      print('API Response: $response'); // Print the API response for debugging

      if (response.statusCode == 200) {
        List<ProductListModel> productList = productListFromJson(response.data);

        // Call the callback function to print the length
        onProductListLength(productList.length);

        return productList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}