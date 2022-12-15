import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/services/shared_preferences/userPreferences.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;


  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    http.Response response = await http.post(
      'http://shopfreshlii.a3jm.com:3050/accounts/authenticate',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        loginData/*<String, dynamic>{
        "email": loginData["email"],
        "password": loginData["password"]
      }*/),

    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      var userData = responseData;

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(String firstName, String lastName, String email, String password, String confirmPassword, bool acceptTerms) async {

    final Map<String, dynamic> registrationData = {
      "title": "Mr",
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "acceptTerms": acceptTerms
    };


    _registeredInStatus = Status.Registering;
    notifyListeners();

    return await http.post(
      'http://shopfreshlii.a3jm.com:3050/accounts/register',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "title": registrationData["title"],
        "firstName": registrationData["firstName"],
        "lastName": registrationData["lastName"],
        "email": registrationData["email"],
        "password": registrationData["password"],
        "confirmPassword": registrationData["confirmPassword"],
        "acceptTerms": registrationData["acceptTerms"]
      }),
    )
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(http.Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {

      var userData = responseData;

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {

      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

}