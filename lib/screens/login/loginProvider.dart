import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/authProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/category/category_screen.dart';
import 'package:saffron_trial_10/screens/login/registerProvider.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class LogInProvider extends StatefulWidget {
  @override
  _LogInProviderState createState() => _LogInProviderState();
}

class _LogInProviderState extends State<LogInProvider> {
  Future<User> futureUser;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);


    var doLogin = () {
      final form = _formKey.currentState;

      if(form.validate()){
        form.save();
        final Future<Map<String, dynamic>> successfulMessage =
        auth.login(emailTEC.text, passwordTEC.text);

        successfulMessage.then((response) {
          if(response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            changeScreenPushReplacement(context, CategoryScreen());
      } else {
            Flushbar(
              title: "Failed Login",
              message: response['message']['message'].toString(),
              duration: Duration(seconds: 3),
            ).show(context);
          }
      });
      } else {
        Flushbar(
          title: "Failed Login",
          message: "Invalid Form",
          duration: Duration(seconds: 3),
        ).show(context);
        print("form is invalide");
      }
    };


    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    return Scaffold(
      key: _key,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body:
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(35))),
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 120),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro SemiCondensed',
                                fontSize: 24,
                                color: const Color(0xff1c982f),
                                letterSpacing: -0.24,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              child: TextFormField(
                                validator: (val) {
                                  return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                      ? null
                                      : "Please provide a valid email.";
                                },
                                controller: emailTEC,
                                style: textFieldStyle(),
                                decoration: textFieldInputDecoration("E-mail", Icons.email_outlined, MediaQuery.of(context).size.height),
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (val) {
                              return val.length < 6
                                  ? "Please provide valid password, more than 6 characters."
                                  : null;
                            },
                            controller: passwordTEC,
                            obscureText: true,
                            style: textFieldStyle(),
                            decoration: textFieldInputDecoration("Password", Icons.lock_outline, MediaQuery.of(context).size.height),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              child: Text(
                                "Forgotten Your Password?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      //TODO make this dynamic
                      height: 30,
                    ),
                    Column(
                      children: [
                        auth.loggedInStatus == Status.Authenticating
                            ? loading : GestureDetector(
                          onTap: () async {
                            if(_formKey.currentState.validate()) {
                              final Future<Map<String, dynamic>> successfulMessage =
                              auth.login(emailTEC.text, passwordTEC.text);
                              successfulMessage.then((response){
                                if(response['status']) {
                                  User user = response['user'];
                                  Provider.of<UserProvider>(context, listen: false).setUser(user);
                                  changeScreenPushReplacement(context, CategoryScreen());
                                } else {
                                  Flushbar(
                                    title: "Failed Login",
                                    message: response['message']['message'].toString(),
                                    duration: Duration(seconds: 3),
                                  ).show(context);
                                }
                              });
                            } else {
                              Flushbar(
                                title: "Failed Login",
                                message: "Invalid form",
                                duration: Duration(seconds: 3),
                              ).show(context);
                            }
                          },
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(40.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 22),
                              decoration: BoxDecoration(
                                color: green,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: white.withOpacity(0.5),
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("SIGN IN", style: buttonText()),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),

                  ],
                ),
              ),

              Container(
                height: 100,
                decoration: BoxDecoration(),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: FlatButton(
                    onPressed: () {
                      changeScreenPush(context, RegisterProvider());
                    },
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}