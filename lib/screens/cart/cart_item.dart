import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/cart.dart';
import 'package:saffron_trial_10/providers/carts.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class CartItem extends StatelessWidget {
  final CartItemsDatumItem itemDetail;

  CartItem({this.itemDetail});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(itemDetail.productId),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        //Provider.of<Cart>(context, listen: false).removeFromCart(orderStoreName,itemDetail.productId);
      },
      background: Container(
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 0,
        //shadowColor: green,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Divider(),
            Container(
              padding: EdgeInsets.all(6),
              child: ListTile(
                leading: CircleAvatar(
                  foregroundColor: green,
                  backgroundColor: green.withOpacity(0.1),
                  child: FittedBox(
                      child: Container(
                        //padding: EdgeInsets.all(10),
                        child: Image(image: NetworkImage(itemDetail.imageUrl),),
                      )
                  ),
                ),
                title: Text("${itemDetail.productName}"),
                subtitle: Text("\$${itemDetail.qty * itemDetail.price}"),
                trailing: Text("${itemDetail.qty} x"),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
