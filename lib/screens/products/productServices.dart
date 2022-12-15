// import 'package:freshlii_trial8/models/product.dart';
// import 'package:http/http.dart' as http;
//
// int p_length;
//
// class productServices {
//   //static const String productURL = 'http://a3jm.ddns.net:8043/freshlii/api/store/v1/productStocks';
//
//   static Future<List<Product>> getProducts(/*String brandName,*/ int storeID) async {
//     final queryParameters = {
//       //"store_category_name": brandName,
//       "store_id" : storeID.toString()
//     };
//     try {
//       final uri = Uri.http("shopfreshlii.a3jm.com:3000", '/v2/products', queryParameters);
//       final response = await http.get(uri);
//       if (response.statusCode == 200) {
//         final List<Product> products = productFromJson(response.body);
//         var length = products.length;
//         print(response.body);
//         print("product length = " +  products.length.toString());
//         p_length = length;
//         return products;
//
//       } else {
//         return List<Product>();
//       }
//     } catch (e) {
//       return List<Product>();
//     }
//   }
// }
