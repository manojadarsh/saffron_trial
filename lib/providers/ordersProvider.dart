import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saffron_trial_10/models/dateslot.dart';

class OrdersProvider with ChangeNotifier {
  static const paymentIntentURL =
      "https://468a7fadf009.ap.ngrok.io/create-payment-intent";

  static const cartToOrderURL =
      "http://192.168.0.188:3060/orders/create-cart-to-order";

  Future<void> createPaymentIntent(
      double amount, String uniqueRequestID, int appID) async {
    final Map<String, dynamic> postPaymentIntent = {
      "amount": amount,
      "data": {
        "uniqueRequestId": "$uniqueRequestID",
        "appId": appID,
      }
    };

    http.Response response = await http.post(paymentIntentURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postPaymentIntent));

    Map<String, dynamic> responseData = {};

    if (response.statusCode == 201) {
      responseData = json.decode(response.body);
      //_paymentIntent = responseData;
      notifyListeners();

      print(responseData);
    } else {
      print("didn't convert to order");
    }
    _paymentIntent = responseData;
    print("notifyL ${_paymentIntent}");
    notifyListeners();
    //return responseData;
  }

  Future<Map<String, dynamic>> cartsToOrder(String uniqueRequestID, int appID,
      String paymentIntentID, String paymentMethodID, Slot slot, String address) async {

    final Map<String, dynamic> postPaymentDetails = {
      "uniqueRequestId": "$uniqueRequestID",
      "appId": appID,
      "userId": uniqueRequestID,
      "paymentInfo": {
        "paymentIntentID": paymentIntentID,
        //"paymentMethodID" : paymentMethodID,
      },
      "deliveryInstructions": {
        "contact": "+39 123 456 7891",
        "slot": "${slot.date}-${slot.month}-${slot.year}",
        "location": "$address",
        "deliveryType": 1,
        "vouchers": [
          {
            "category": 0,
            "storeId": 0,
            "code": "platformVoucher",
            "amount": 0.3
          },
          {
            "category": 1,
            "storeId": 10,
            "code": "Deepavali",
            "amount": 0.1
          },
          {
            "category": 1,
            "storeId": 20,
            "code": "Onam",
            "amount": 0.2
          }
        ]
      }
    };

    //print(postPaymentDetails);

    http.Response response = await http.post(cartToOrderURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(postPaymentDetails));

    Map<String, dynamic> responseData = {};

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      print("converted stripe to order");
      responseData = json.decode(response.body);
      //_paymentIntent = responseData;
      notifyListeners();
      return responseData;

      print(responseData);
    } else {
      print("didn't convert stripe to order");
      return {};
    }
    _cartToOrder = responseData;
    print("notifyL ${_cartToOrder}");
    notifyListeners();

  }

  Map<String, dynamic> _cartToOrder = {};

  Map<String, dynamic> get cartToOrder => _cartToOrder;


  Map<String, dynamic> _paymentIntent = {};

  Map<String, dynamic> get paymentIntent => _paymentIntent;
}
