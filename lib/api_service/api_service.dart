




import 'package:dio/dio.dart';

import '../data/model/response_model/product_list_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<ProductListModel>> fetchProductList() async {
    try {
      final response = await _dio.get('https://backend-test.bazar365.com/api/productGroup/products');
      if (response.statusCode == 200) {
        List<ProductListModel> productList = productListFromJson(response.data);

        return productList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
