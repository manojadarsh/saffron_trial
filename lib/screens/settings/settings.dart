import 'package:flutter/material.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/login/preLoginVerification.dart';
import 'package:saffron_trial_10/screens/settings/orders/past_orders_screens.dart';
import 'package:saffron_trial_10/screens/settings/profile/profile.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  double marginPaddingVertical = 2;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.getUser();
    User user = userProvider.user;
    print(user.firstName);

    showLogOutAlertDialog() {
      Widget cancelButton = FlatButton(
        child: Text("Cancel"),
        onPressed: () {Navigator.pop(context);},
      );
      Widget confirmLogout = RaisedButton(
        color: red,
        child: Text("Logout"),
        onPressed: () async {
          await Provider.of<UserProvider>(context, listen: false).logOutUser();
          changeScreenPushReplacement(context, PreLoginVerification());
        },
      );

      AlertDialog alertDialog = AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout."),
        actions: [
          cancelButton,
          confirmLogout,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alertDialog;
          });
    }

    return Scaffold(
      body: Column(
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
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
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
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                      decoration: BoxDecoration(
                          color: lightgreen,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        onTap: () {
                          changeScreenPush(context, ProfileScreen());
                        },
                        leading: Icon(
                          Icons.person_outline_outlined,
                          color: green,
                        ),
                        title: Text(
                          "Profile",
                          style: textFieldStyle(),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: green,
                        ),
                      )),
                Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                    decoration: BoxDecoration(
                        color: lightgreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
onTap: () {
  changeScreenPush(context, PastOrdersScreen());
},
                      leading: Icon(
                        Icons.menu_book,
                        color: green,
                      ),
                      title: Text(
                        "Orders",
                        style: textFieldStyle(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: green,
                      ),
                    )),
                Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                    decoration: BoxDecoration(
                        color: lightgreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(

                      leading: Icon(
                        Icons.contact_phone_outlined,
                        color: green,
                      ),
                      title: Text(
                        "Address and Contact",
                        style: textFieldStyle(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: green,
                      ),
                    )),
                Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                    decoration: BoxDecoration(
                        color: lightgreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(

                      leading: Icon(
                        Icons.messenger_outline,
                        color: green,
                      ),
                      title: Text(
                        "Feedback",
                        style: textFieldStyle(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: green,
                      ),
                    )),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                    decoration: BoxDecoration(
                      border: Border.all(color: green),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(

                      leading: Icon(
                        Icons.map_outlined,
                        color: green,
                      ),
                      title: Text(
                        "Language",
                        style: textFieldStyle(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: green,
                      ),
                    )),
                Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                    decoration: BoxDecoration(
                        border: Border.all(color: green),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(

                      leading: Icon(
                        Icons.question_answer_outlined,
                        color: green,
                      ),
                      title: Text(
                        "FAQ",
                        style: textFieldStyle(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: green,
                      ),
                    )),
                Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                    decoration: BoxDecoration(
                        border: Border.all(color: green),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(

                      leading: Icon(
                        Icons.indeterminate_check_box_sharp,
                        color: green,
                      ),
                      title: Text(
                        "Terms and Conditions",
                        style: textFieldStyle(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: green,
                      ),
                    )),

                Container(
                    margin:
                    EdgeInsets.symmetric(horizontal: 15, vertical: marginPaddingVertical),
                    decoration: BoxDecoration(
                        //border: Border.all(color: green),
                        color: red,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(
                        "Log Out",
                        textAlign: TextAlign.center,
                        style: textFieldStyleSizeColor(17, white),
                      ),
                      onTap: () {
                        showLogOutAlertDialog();
                      },
                    )),

              ],
            ),
          ),
          // Text(user.firstName),
          // Text(user.lastName),
          // Text("${user.id}"),
          // Container(
          //   child: Center(
          //     child: RaisedButton(
          //       child: Text("Logout"),
          //       onPressed: () {
          //         showLogOutAlertDialog();
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
