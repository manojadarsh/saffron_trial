import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';

import '../../../app_properties.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.getUser();
    User user = userProvider.user;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
              child: Stack(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Settings",
                        style: headingTextStyle(),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 10),
              //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text("Your Information", style: textFieldStyleSize(18),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lightgreen
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name", style: textFieldStyleSize(12),),
                        Text(user.firstName, style: textFieldStyleSizeColor(14, grey),),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit_outlined),
                    ),
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Last Name", style: textFieldStyleSize(12),),
                        Text(user.lastName, style: textFieldStyleSizeColor(14, grey),),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit_outlined),
                    ),
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-Mail", style: textFieldStyleSize(12),),
                        Text(user.email, style: textFieldStyleSizeColor(14, grey),),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit_outlined),
                    ),
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       // Text("Change Password", style: textFieldStyleSize(12),),
                        Text("Change Password", style: textFieldStyleSize(14),),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.open_in_browser),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 10),
              //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text("Your Preferences", style: textFieldStyleSize(18),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightgreen
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Notifications", style: textFieldStyleSize(16),),
                        //Text(user.firstName, style: textFieldStyleSizeColor(14, grey),),
                      ],
                    ),
                    trailing: Switch(value: true, onChanged: (value){

                    },activeColor: green, inactiveThumbColor: red,)
                  ),
                  ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Newsletter", style: textFieldStyleSize(16),),
                          //Text(user.firstName, style: textFieldStyleSizeColor(14, grey),),
                        ],
                      ),
                      trailing: Switch(value: false, onChanged: (value){

                      },activeColor: green, inactiveThumbColor: red,)
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
