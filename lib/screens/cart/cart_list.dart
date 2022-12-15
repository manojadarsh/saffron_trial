import 'package:flutter/material.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/models/cart.dart';
import 'package:saffron_trial_10/providers/carts.dart';
import 'package:saffron_trial_10/providers/cartsProvider.dart';
import 'package:saffron_trial_10/screens/cart/cart_item.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  final CartItemsDatum cartItemsDatum;
  //final List<CartItemsDatumItem> items;

  CartList({this.cartItemsDatum});

  @override
  Widget build(BuildContext context) {
    //print("${items.length}");

    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      //elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(image: NetworkImage(cartItemsDatum.logoUrl), fit: BoxFit.cover),
                ),
                //child: Image(image:NetworkImage(cartItemsDatum.imageUrl), fit: BoxFit.container,),
              ),
              title: Text("${cartItemsDatum.name.substring(cartItemsDatum.name.indexOf(".") + 1)}", ),
              trailing: IconButton(icon: Icon(Icons.delete),),
            ),


            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     CircleAvatar(
            //       foregroundColor: green,
            //       backgroundColor: green.withOpacity(0.1),
            //       child: FittedBox(
            //           child: Container(
            //         //padding: EdgeInsets.all(10),
            //         child: Image(
            //           image: NetworkImage(cartItemsDatum.imageUrl),
            //         ),
            //       )),
            //     ),
            //     Text(
            //       "${cartItemsDatum.name.substring(cartItemsDatum.name.indexOf(".") + 1)}",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(color: green, fontSize: 17),
            //     ),
            //   ],
            // ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
                itemDetail: cartItemsDatum.items[index],
              ),
              itemCount: cartItemsDatum.items.length,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<CartProvider>(
                  builder: (_, cart, x) => Text(
                    "Store Quantity: ${cartItemsDatum.itemCount}",
                    style: TextStyle(color: green),
                  ),
                ),
                Consumer<CartProvider>(
                  builder: (_, cart, x) => Text(
                    "Total: \$ ${cartItemsDatum.cost.toStringAsFixed(2)}",
                    style: TextStyle(color: green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
