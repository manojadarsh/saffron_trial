import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/services/shared_preferences/userPreferences.dart';

class UserProvider with ChangeNotifier {
  User _user = new User();

  User get user {
    /*UserPreferences().getUser().then((result) {
      _user = result;
    });
    notifyListeners();*/
    return _user;
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void getUser () {
    UserPreferences().getUser().then((result) {
      _user = result;
    });
    notifyListeners();
    //return _user;
  }

  void logOutUser() {
    _user = null;
    UserPreferences().removeUser();
    notifyListeners();
  }

}