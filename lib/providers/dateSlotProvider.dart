import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/dateslot.dart';
import 'package:http/http.dart' as http;

class DateSlotsProvider with ChangeNotifier {


  Future<DateSlots> getSlots(String userID, int deliveryType) async {
    final queryParameters = {
      "appId": "1",
      "uniqueRequestId" : "$userID",
      "deliveryType" : "$deliveryType",
    };
    try {
      //TODO this is the issue - must fix.
      final uri = Uri.http("192.168.0.188:3060", '/orders/get-delivery-slots', queryParameters);
      //print(uri);
      final response = await http.get(uri);
      //print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final DateSlots daSlots = dateSlotsFromJson(response.body);
        _dateSlots = daSlots;
        print(_dateSlots.data.response.length);
        notifyListeners();
        //return stores;

      } else {
        print("error1");
        return DateSlots();
      }
    } catch (e) {
      print(e.toString());
      return DateSlots();
    }
    //notifyListene  rs();
    //print(_stores);
  }


  DateSlots _dateSlots = DateSlots();

  DateSlots get dateSlots => _dateSlots;
}


class SlotProvider with ChangeNotifier {
  Slot _slot = Slot();

  setSlot (Slot slot) {
    _slot = slot;
    notifyListeners();
  }

  Slot get slot => _slot;
}