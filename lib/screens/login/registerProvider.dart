import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/providers/authProvider.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/screens/login/loginProvider.dart';
import 'package:provider/provider.dart';

class RegisterProvider extends StatefulWidget {
  @override
  _RegisterProviderState createState() => _RegisterProviderState();
}

class _RegisterProviderState extends State<RegisterProvider> {
  final _key = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  //TEC - text editing controller
  TextEditingController firstNameTEC = new TextEditingController();
  TextEditingController lastNameTEC = new TextEditingController();
  TextEditingController telephoneTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();
  TextEditingController confirmPasswordTEC = new TextEditingController();
  bool acceptTemrs = false;
  String titleController;

  var loading = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      CircularProgressIndicator(),
      Text(" Authenticating ... Please wait")
    ],
  );

  @override
  Widget build(BuildContext context) {


    AuthProvider auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _key,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        //mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Acumin Pro SemiCondensed',
                                fontSize: 24,
                                color: const Color(0xff1c982f),
                                letterSpacing: -0.24,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 5, 4, 5),
                                  child: TextFormField(
                                    validator: (val) {
                                      return val.isEmpty || val.length < 1
                                          ? "Please provide a valid name."
                                          : null;
                                    },
                                    controller: firstNameTEC,
                                    style: textFieldStyle(),
                                    decoration: textFieldInputDecoration(
                                        "First Name",
                                        Icons.person,
                                        MediaQuery.of(context).size.height),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 5, 4, 5),
                                  child: TextFormField(
                                    validator: (val) {
                                      return val.isEmpty || val.length < 1
                                          ? "Please provide a valid name."
                                          : null;
                                    },
                                    controller: lastNameTEC,
                                    style: textFieldStyle(),
                                    decoration: textFieldInputDecoration(
                                        "Last Name",
                                        Icons.person,
                                        MediaQuery.of(context).size.height),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          /*Padding(
                            padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
                            child: TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 1
                                    ? "Please provide a valid name."
                                    : null;
                              },
                              controller: firstNameTEC,
                              style: textFieldStyle(),
                              decoration: textFieldInputDecoration(
                                  "First Name", Icons.person, MediaQuery.of(context).size.height),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
                            child: TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 1
                                    ? "Please provide a valid name."
                                    : null;
                              },
                              controller: lastNamteTEC,
                              style: textFieldStyle(),
                              decoration: textFieldInputDecoration(
                                  "Last Name", Icons.person, MediaQuery.of(context).size.height),
                            ),
                          ),*/
                          //TODO put parameters
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
                            child: TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 1
                                    ? "Please provide a valid telephone number."
                                    : null;
                              },
                              controller: telephoneTEC,
                              keyboardType: TextInputType.phone,
                              style: textFieldStyle(),
                              decoration: textFieldInputDecoration(
                                  "Telephone Number",
                                  Icons.phone,
                                  MediaQuery.of(context).size.height),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
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
                              decoration: textFieldInputDecoration(
                                  "E-mail",
                                  Icons.email_outlined,
                                  MediaQuery.of(context).size.height),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
                            child: TextFormField(
                              validator: (val) {
                                return val.length < 6
                                    ? "Please provide valid password, more than 6 characters."
                                    : null;
                              },
                              controller: passwordTEC,
                              style: textFieldStyle(),
                              obscureText: true,
                              decoration: textFieldInputDecoration(
                                  "Password",
                                  Icons.lock_outline,
                                  MediaQuery.of(context).size.height),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
                            child: TextFormField(
                              validator: (val) {
                                return val.length < 6
                                    ? "Please provide valid password, more than 6 characters."
                                    : null;
                              },
                              controller: confirmPasswordTEC,
                              style: textFieldStyle(),
                              obscureText: true,
                              decoration: textFieldInputDecoration(
                                  "Confirm Password",
                                  Icons.lock_outline,
                                  MediaQuery.of(context).size.height),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    'Accept Terms and Conditions:',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Checkbox(
                                      activeColor: green,
                                      value: acceptTemrs,
                                      onChanged: (value) {
                                        setState(() {
                                          acceptTemrs = value;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    auth.registeredInStatus == Status.Registering
                        ? loading : GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          auth
                              .register(
                                  firstNameTEC.text,
                                  lastNameTEC.text,
                                  emailTEC.text,
                                  passwordTEC.text,
                                  confirmPasswordTEC.text,
                                  acceptTemrs)
                              .then((response){
                                if(response['status']) {
                                  User user = response['data'];
                                  Navigator.pop(context);
                                } else {
                                  Flushbar(
                                    title: "Registeration Failed",
                                    message: response.toString(),
                                    duration: Duration(seconds: 10),
                                  ).show(context);
                                }
                          });
                        } else {
                          Flushbar(
                            title: "Invalid form",
                            message: "Please Complete the form properly",
                            duration: Duration(seconds: 10),
                          ).show(context);
                        }
                        print("hello");
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
                              Text("SIGN UP", style: buttonText()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: FlatButton(
                onPressed: () {
                  changeScreenPush(context, LogInProvider());
                },
                child: Text(
                  "SIGN IN",
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
    );
  }
}
