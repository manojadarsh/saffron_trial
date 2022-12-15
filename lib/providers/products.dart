import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {

  Future<List<Product>> getProducts(/*String brandName,*/ int storeID) async {
    final queryParameters = {
      //"store_category_name": brandName,
      "store_id" : storeID.toString()
    };
    try {
      final uri = Uri.http("192.168.0.188:3000", '/v2/products', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<Product> products = productFromJson(response.body);
        var length = products.length;
        print(response.body);
        print("product length = " +  products.length.toString());
        var p_length = length;
        _products = products;

        notifyListeners();

      } else {
        return List<Product>();
      }
    } catch (e) {
      return List<Product>();
    }
  }


  Future<List<Product>> getProductsByName(/*String brandName,*/ int storeID, String searchName) async {
    final queryParameters = {
      //"store_category_name": brandName,
      "store_id" : storeID.toString(),
      "product_name" : searchName,
    };
    try {
      final uri = Uri.http("192.168.0.188:3000", '/v2/products', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<Product> products = productFromJson(response.body);
        var length = products.length;
        print(response.body);
        print("product length = " +  products.length.toString());
        var p_length = length;
        _productsByName = products;

        notifyListeners();

      } else {
        return List<Product>();
      }
    } catch (e) {
      return List<Product>();
    }
  }

  List<Product> _productsByName = [];

  List<Product> get productsByName => _productsByName;

  List<Product> _products = [];

  List<Product> products (int storeID) {
    getProducts(storeID);
    //notifyListeners();
    return _products;
  }

  List<Product> get productNoParam => _products;

}