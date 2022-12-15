import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/cart.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:http/http.dart' as http;

import '../app_properties.dart';

enum CartStatus { Adding, Added, Verifying, NotAdded, NotAbleToAdd }

class CartProvider with ChangeNotifier {
  static const String addToCartURL =
      'http://192.168.0.188:3045/carts/create-carts';

  Cart _cart;


  int _cartCount;
  //int _cartCount = _cart.results.checkout.cartTotals.items;

  int get cartCount {
    return _cartCount;
  }

  Cart get cart {
    return _cart;
  }

  CartStatus _cartStatus = CartStatus.NotAdded;

  CartStatus get cartStatus => _cartStatus;
  //Future<Map<String, dynamic>>

  void addToCart(
      BuildContext context, Product product, int quantity, User user) async {
    _cartStatus = CartStatus.NotAdded;

    var result;
    print(user.id);
    final Map<String, dynamic> desiredProductData = {
      "app_id": product.appId,
      "company_id": product.companyId,
      "brand_id": product.brandId,
      "store_id": product.storeId,
      "store_name": "${product.storeName}",
      "product_description": "${product.productDescription}",
      "product_name": "${product.productName}",
      "image_url": "${product.imageUrl}",
      "unit": product.productUnit,
      "product_unit_name": "${product.productUnitName}",
      "product_sku": "${product.productSku}",
      "product_id": "${product.productId}",
      "qty": quantity,
      "price": product.price,
      "discount": 0,
      "weight": product.weight,
      "promo_code": null,
      "request_id": "${user.id}",
      "user_id": user.id,
      "order_qty": 2,
      "cost": 1.79,
      "order_cost": null,
      "order_discount": null,
      "uniqueRequestId": "${user.id}",
    };

    _cartStatus = CartStatus.Adding;
    //notifyListeners();

    http.Response response = await http.post(addToCartURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(desiredProductData));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      _cartStatus = CartStatus.Added;
      print(responseData);
      showProductStatusSnackBar(context, cartStatus, responseData);
      //showProductStatusDialog(context, _cartStatus, responseData);
      notifyListeners();
      print(responseData);
    } else {
      print("didn't add");
    }
  }

  showProductStatusSnackBar(BuildContext context, CartStatus status,
      Map<String, dynamic> responseData) {
    String message;
    if (status == CartStatus.Added) {
      message =
          "Added ${responseData['data']['response']['received']['qty']} unit of ${responseData['data']['response']['received']['product_description']} To Cart";
    } else {
      message = "Sorry, Item Wasn't Added To Cart";
    }
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$message'),
      duration: Duration(milliseconds: 75),
    ));
  }

  showProductStatusDialog(BuildContext context, CartStatus status,
      Map<String, dynamic> responseData) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    String message;
    if (status == CartStatus.Added) {
      message = "Added To Cart";
    } else {
      message = "Sorry, Item Wasn't Added To Cart";
    }
    AlertDialog alertDialog = AlertDialog(
      title: Text(message),
      content: Text(
          "${responseData['message']}, you have added ${responseData['data']['response']['received']['qty']} unit of ${responseData['data']['response']['received']['product_description']}"),
      actions: [
        cancelButton,
        //confirmLogout,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Future<Cart> getCart(String appId, String userId) async {
    print(appId);
    print(userId);
    final queryParameters = {"appId": appId, "userId": userId};
    try {
      //TODO this is the issue - must fix.
      final uri =
          Uri.http("192.168.0.188:3045", '/carts/get-carts', queryParameters);
      //print(uri);
      final response = await http.get(uri);
      print(response.statusCode);
      //print(response.body);
      if (response.statusCode == 200) {
        final Cart cart = cartFromJson(response.body);
        print("hi");
        print(cart.status);
        _cart = cart;
        print(_cart);
        print(cart.status);
        print("${_cart.status}");
        _cartCount = await cart.results.checkout.cartTotals.items;
        print("provider ${_cartCount}");
        //print(_stores);
        print("lenght: ${_cart.status}");
        //check if this is correct
        notifyListeners();
        //return stores;

      } else {
        print("error1");
        return Cart();
      }
    } catch (e) {
      print(e.toString());
      return Cart();
    }
    //notifyListeners();
    print(_cart);
  }
}
