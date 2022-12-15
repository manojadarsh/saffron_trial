import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;


class DeliveryTypeProvider with ChangeNotifier {

 // String _updateStoreURL = "http://shopfreshlii.a3jm.com:3085/store-admin/update-store-status";

  bool _deliveryType = false;

  bool get deliveryType => _deliveryType;

  void changeStatus(
      BuildContext context, int appID, int userID, int companyID, int brandID, int storeID) async {
    var result;
    int deliveryTypeStatus = 0;
    if(_deliveryType == true) {
      deliveryTypeStatus = 1;
      print(deliveryTypeStatus);
    }
    print(deliveryTypeStatus);

    // var uuid = Uuid();
    //
    // var uniqueID = uuid.v4();
    // final Map<String, dynamic> desiredProductData = {
    //   "uniqueRequestId" : "$uniqueID",
    //   "appId": appID,
    //   "userId" : userID,
    //   "companyId": companyID,
    //   "brandId": brandID,
    //   "storeId": storeID,
    //   "storeStatus": deliveryTypeStatus,
    //   "statusStartTime": "2021-03-07 10:00:00",
    //   "statusEndTime": "2021-03-07 12:00:00",
    //   "statusMessage": "Unprecedented Volumes - no stock",
    //   "statusRemarks": "Unprecedented Volumes - no stock"
    // };
    // print(desiredProductData);
    // notifyListeners();
    //
    // http.Response response = await http.post(_updateStoreURL,
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(desiredProductData));
    //
    // print(response.body);
    //
    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> responseData = json.decode(response.body);
    //   showProductStatusSnackBar(context, responseData);
    //   //showProductStatusDialog(context, _cartStatus, responseData);
    //   notifyListeners();
    //   //print(responseData);
    // } else {
    //   print("didn't add");
    // }
  }

  showProductStatusSnackBar(BuildContext context,
      Map<String, dynamic> responseData) {
    int storeStatusInt;
    String message;
    bool storeStatus = _deliveryType;
    if(storeStatus == true) {
      storeStatusInt = 1;
      print(storeStatusInt);
    }

    if (storeStatus == true) {
      message =
      "You're Online";

    } else {
      message = "You're Offline";
    }
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$message'),
      duration: Duration(seconds: 1),
    ));
  }

  switchDeliveryType(BuildContext context) {
    _deliveryType = !_deliveryType;
    print("${_deliveryType}");
    notifyListeners();
  }
}