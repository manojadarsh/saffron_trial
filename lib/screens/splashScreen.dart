import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/screens/login/preLoginVerification.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1500);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>
      PreLoginVerification()
      //SignIn()
    )
    );
  }
  initScreen(BuildContext context) {
    return Scaffold(
      body:
              Center(
                child: Container(
                  alignment: Alignment.center,
                  //width: MediaQuery.of(context).size.width-50,
                  //height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/freshlii_logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              /*CircularProgressIndicator(
                backgroundColor: green,
                strokeWidth: 1,
              )*/

    );
  }
}

