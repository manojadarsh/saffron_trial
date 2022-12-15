import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/models/pastOrders.dart';
import 'package:saffron_trial_10/screens/settings/orders/past_order_item.dart';



class PastOrderedItems extends StatelessWidget {
  final Order order;
  PastOrderedItems(this.order);
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: order.orderDetails.items.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: order.orderDetails.items[index],
            child: PastOrderedItem(),
          )),
    );
  }
}
