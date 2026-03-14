import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_katalog/model/product_model.dart';

class ApiService {

  Future<ProductModel> fetchProducts() async {
    final response = await http.get(Uri.parse("https://www.wantapi.com/products.php"));
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception("Ürünler alınırken bir hata oluştu!");
    }
  }
}