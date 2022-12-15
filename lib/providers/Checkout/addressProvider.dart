import 'package:flutter/material.dart';

class AddressProvider with ChangeNotifier{
  String streetNumber;
  String streetName;
  String cityName;
  String ZIPCode;
  String instructions;


  void setStreetNumber(String streetNum){
    streetNumber = streetNum;
    notifyListeners();
  }

  void setStreetName(String streetNam){
    streetName = streetNam;
    notifyListeners();
  }

  void setCityName(String citName){
    cityName = citName;
    notifyListeners();
  }

  void setZIPCode(String zip){
    ZIPCode = zip;
    notifyListeners();
  }

  void setInstructions(String inst){
    instructions = inst;
    notifyListeners();
  }

  String getStreetNumber() {
    return streetNumber;
  }

  String getStreetName(){
    return streetName;
  }

  String getCityName(){
    return cityName;
  }

  String getZIPCode() {
    return ZIPCode;
  }

  String getInstructions() {
    return instructions;
  }
}