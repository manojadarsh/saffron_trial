import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/models/pastOrders.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/pastOrdersProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/settings/orders/past_ordered_items.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';
import 'package:saffron_trial_10/widgets/pop_top_appBar.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/widgets/top_appBar.dart';

class PastOrdersScreen extends StatefulWidget {
  @override
  _PastOrdersScreenState createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen> {
  showAlertDialog(BuildContext context, Order order) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("${order.customerReference}"),
      content: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: PastOrderedItems(order)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final pastOrderProvider =
        Provider.of<PastOrdersProvider>(context, listen: false);
    final User user = userProvider.user;
    pastOrderProvider.postPastOrders(1, user.id);
  }

  @override
  Widget build(BuildContext context) {
    final pastOrderProvider =
        Provider.of<PastOrdersProvider>(context, listen: true);
    final pastorders =
        pastOrderProvider.pastOrders.data.storeOrders.response.orders;
    return Scaffold(
      body: Column(
        children: [
          PopTopAppBar(
            message: "Past Orders",
          ),
          Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 6 -
                75,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: pastorders.length,
                itemBuilder: (context, index) {
                  var porder = pastorders[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        showAlertDialog(context, porder);
                      },
                      child: Container(
                        child: Text(
                          "${porder.customerReference}",
                          style: textFieldStyleSizeColor(18, white),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
