import 'package:flutter/material.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/models/cart.dart';
import 'package:saffron_trial_10/screens/checkout/delivery/deliveryScreen.dart';
import 'package:saffron_trial_10/screens/checkout/order/orderScreen.dart';
import 'package:saffron_trial_10/services/stripe/paymentService.dart';
import 'address/addressScreen.dart';
import 'package:progress_dialog/progress_dialog.dart';


class CheckoutScreen extends StatefulWidget {
  final Cart cart;

  CheckoutScreen({this.cart});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  onItemPress(BuildContext context, int index) async {
    switch(index) {
      case 0:
        payViaNewCard(context);
        print("hi");
        //payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, '/existing-cards');
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }


  payViaNewCard(BuildContext context) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(
        message: 'Please Wait'
    );
    await dialog.show();

    var response = await StripeService.payWithNewCard(amount: '${widget.cart.results.checkout.cartTotals.cost}');
    await dialog.hide();
    if(response.success == true) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(response.message), duration: Duration(milliseconds: 1200),));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(response.message), duration: Duration(milliseconds: 3000),));
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: green, //change your color here
          ),
            backgroundColor: white,

          title: Text('Home Page', style: textFieldStyleSize(20),),
          shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          bottom: TabBar(
            labelColor: white,
            indicator: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(10)
            ),
            indicatorColor: green,
            unselectedLabelColor: lightgrey,
            tabs: [
              Tab(icon: Icon(Icons.location_on_outlined),),
              Tab(icon: Icon(Icons.delivery_dining),),
              Tab(icon: Icon(Icons.credit_card),),
              Tab(icon: Icon(Icons.list),),
            ],
          ),
        ),
        body: TabBarView(

          children: [
            Center(child: AddressScreen(title: "Hello",),),
            Center(child: DeliveryScreen(cart: widget.cart,),),
            Container(
              padding: EdgeInsets.all(20),
              child: ListView.separated(itemBuilder: (context, index) {
                Icon icon;
                Text text;
                switch (index) {
                  case 0:
                    icon = Icon(Icons.add);
                    text = Text("Pay via new card");
                    break;
                  case 1:
                    icon = Icon(Icons.credit_card);
                    text = Text("Pay via existing card");
                    break;
                }
                return InkWell(
                  onTap: () {
                    onItemPress(context, index);
                  },
                  child: ListTile(
                    title: text,
                    leading: icon,
                  ),
                );
              }, separatorBuilder: (context, index) {
                return Divider(color: Colors.grey,);
              }, itemCount: 2),
            ),
            Center(child: OrderScreen(cart: widget.cart,),),
          ],
        ),
      ),
    );
  }
}
