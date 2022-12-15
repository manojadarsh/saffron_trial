import 'package:flutter/material.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/providers/Checkout/addressProvider.dart';
import 'package:saffron_trial_10/models/dateslot.dart';
import 'package:saffron_trial_10/providers/dateSlotProvider.dart';
import 'package:saffron_trial_10/providers/ordersProvider.dart';
import 'package:saffron_trial_10/screens/orderConfirmation/order_confirmation.dart';
import 'package:saffron_trial_10/services/stripe/paymentService.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/models/cart.dart';

class OrderScreen extends StatefulWidget {
  final Cart cart;

  OrderScreen({this.cart});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Map<String, dynamic> clientSecret;

  onItemPress(
      BuildContext context, int index, String amount, String clientSec) async {
    switch (index) {
      case 0:
        payViaNewCard(context, amount, clientSec);
        print("hi");
        //payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, '/existing-cards');
        break;
    }
  }

  payViaNewCard(BuildContext context, String amount, String clientSec) async {
    ProgressDialog dialog = new ProgressDialog(context);
    dialog.style(message: 'Please Wait');
    await dialog.show();

    var response = await StripeService.payWithNewCard(
        amount: amount, clientSecret: clientSec);
    await dialog.hide();
    if (response.success == true) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(response.message),
        duration: Duration(milliseconds: 1200),
      ));
      Slot slot = Provider.of<SlotProvider>(context, listen: false).slot;
      print("slots provider: ${slot.date}-${slot.month}-${slot.year}");

      final addressPro = Provider.of<AddressProvider>(context, listen: false);
      String address = "${addressPro.streetNumber}, ${addressPro.streetName}, ${addressPro.cityName}, ${addressPro.ZIPCode}";

      print(address);

      Map<String, dynamic> orderResponse =
          await Provider.of<OrdersProvider>(context, listen: false)
              .cartsToOrder(
                  widget.cart.results.cartsData.userId,
                  int.parse(widget.cart.results.cartsData.appId),
                  response.paymentIntentResult.paymentIntentId,
                  response.paymentIntentResult.paymentMethodId,
                  slot, address);
      if (orderResponse["message"] == "Cart To Order Creation success") {
        print(orderResponse["data"]["response"]["response"]
                    ["orderBookingHeader"]["order_booking_header"]
                ["order_reference"]
            //["response"]["orderBookingHeader"]["order_booking_header"]["order_reference"]
            );
        changeScreenPushReplacement(
            context,
            OrderConfirmation(orderResponse["data"]["response"]["response"]
                    ["orderBookingHeader"]["order_booking_header"]
                ["order_reference"]));
      }

      print("dialog: ${response.paymentIntentResult.paymentIntentId}");
      print("dialog: ${response.paymentIntentResult.paymentMethodId}");
    } else {
      print("orderscree: ${response.message}");
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(response.message),
        duration: Duration(milliseconds: 3000),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
    final paymentIntent = Provider.of<OrdersProvider>(context, listen: false);
    paymentIntent.createPaymentIntent(
        widget.cart.results.checkout.cartTotals.cost,
        widget.cart.results.cartsData.userId,
        int.parse(widget.cart.results.cartsData.appId));
    clientSecret = paymentIntent.paymentIntent;
    print('hi: $clientSecret');
  }

  @override
  Widget build(BuildContext context) {
    final paymentIntent = Provider.of<OrdersProvider>(context, listen: true);
    final addressPro = Provider.of<AddressProvider>(context, listen: true);
    final slotsProvider = Provider.of<SlotProvider>(context, listen: true);
    print("address : ${addressPro.cityName}");
    clientSecret = paymentIntent.paymentIntent;
    // var clientSecret = paymentIntent.createPaymentIntent(widget.cart.results.checkout.cartTotals.cost, widget.cart.results.cartsData.userId, int.parse(widget.cart.results.cartsData.appId));

    print("build: ${clientSecret['client_secret']}");

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text("${clientSecret['client_secret']}"),
            Text("HI"),
            Text("${widget.cart.results.checkout.cartTotals.cost}"),
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.separated(
                  itemBuilder: (context, index) {
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
                        if (addressPro.getCityName() != null &&
                            addressPro.ZIPCode != null &&
                            addressPro.streetName != null) {
                          onItemPress(
                              context,
                              index,
                              widget.cart.results.checkout.cartTotals.cost
                                  .toString(),
                              clientSecret['client_secret']);
                        }
                        print("so sorry");
                      },
                      child: ListTile(
                        title: text,
                        leading: icon,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey,
                    );
                  },
                  itemCount: 2),
            ),
          ],
        ),
      ),
    );
  }
}
