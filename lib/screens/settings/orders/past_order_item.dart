import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/models/pastOrders.dart';


class PastOrderedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Item>(context);
    return Container(
      child: Text("${item.productName} x ${item.bookedQuantity} = ${item.orderedPrice}"),
    );
  }
}
