import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:saffron_trial_10/models/pastOrders.dart';

class PastOrdersProvider with ChangeNotifier {

  String now = DateFormat('yyyy-MM-dd').format(DateTime.now());


  PastOrders _pastOrders = PastOrders();

  PastOrders get pastOrders => _pastOrders;

  static const _pastOrdersURL ="http://shopfreshlii.a3jm.com:3060/orders/getCustomerOrders";

  Future postPastOrders(int appID, int userID) async {
    print(now);
    final Map<String, dynamic> pastOrderDetails = {
      "app_id": appID,
      "user_id": userID,
      "customer_id": 1001,
      "request_type": "orders",
      "options": {
        "date_from": "2021-02-11",
        "date_to": "2021-04-12",
        "order_types": {
          "delivery": true,
          "store_delivery": true,
          "store_pickup": true
        },
        "order_status": {
          "cancel_order": true,
          "delivered_order": true,
          "new_order": false,
          "refunded_order": true,
          "disputed_order": true
        }
      }
    }
    ;

    //print(postPaymentDetails);

    http.Response response = await http.post(_pastOrdersURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(pastOrderDetails));

    Map<String, dynamic> responseData = {};

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      print("got past orders");
      responseData = json.decode(response.body);
      PastOrders orders = PastOrders.fromJson(responseData);
      //_paymentIntent = responseData;
      _pastOrders = orders;
      notifyListeners();
      //return pastOrders;

      print(responseData);
    } else {
      print("didn't get past orders");
    }

  }
}