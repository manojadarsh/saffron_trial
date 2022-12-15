import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/screens/category/category_screen.dart';
import 'package:saffron_trial_10/screens/login/loginProvider.dart';
import 'package:saffron_trial_10/services/shared_preferences/userPreferences.dart';

class PreLoginVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();

    return Scaffold(
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if(snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              else if (snapshot.data.jwtToken == null) {
                return LogInProvider();
              }
              return CategoryScreen();
          }
        },
      ),
    );
  }
}
