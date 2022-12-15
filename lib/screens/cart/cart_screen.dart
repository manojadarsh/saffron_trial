import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/models/cart.dart' as CartModel;
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/carts.dart';
import 'package:saffron_trial_10/providers/cartsProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/cart/cart_list.dart';
import 'package:saffron_trial_10/screens/checkout/checkoutScreen.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

// class CartScreen extends StatelessWidget {
//   static const routeName = '/cart';
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     final cartProvider = Provider.of<CartProvider>(context, listen: false);
//
//
//     cartProvider.getCart("1", "36");
//     CartModel.Cart receivedCart = cartProvider.cart;
//     print(receivedCart.status);
//     receivedCart.results.checkout.cartItemsData.forEach((element) {
//       print(element.companyId);
//     });
//     print("cart length: ${cart.orders.length}");
//
//     Widget okButton = FlatButton(
//       child: Text("OK"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Please try again."),
//       content: Text("There appears to be nothing in the cart."),
//       actions: [
//         okButton,
//       ],
//     );
//
//     return Scaffold(
//       floatingActionButton:  Container(
//         alignment: Alignment.bottomCenter,
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.only(left: 25, top: 10,),
//         child: Card(
//           elevation: 2,
//           //margin: EdgeInsets.only(left: 15, top: 10, right: 15),
//           child: Container(
//
//             //height: EdgeInsets.all(8),
//             padding: EdgeInsets.all(8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Total :',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Chip(
//                       label: Text(
//                         "\$${receivedCart.results.checkout.cartTotals.cost.toStringAsFixed(2)}",
//                         style: TextStyle(
//                           color: white,
//                         ),
//                       ),
//                       backgroundColor: Theme.of(context).primaryColor,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                         "${receivedCart.results.checkout.cartTotals.items} items"),
//                   ],
//                 ),
//
//                 //Spacer(),
//                 FlatButton(
//                   onPressed: () {
//                     if(receivedCart.results.checkout.cartTotals.items > 0){
//                       changeScreenPush(context, CheckoutScreen(cart: receivedCart,));
//                     }
//                         else {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return alert;
//                         },
//                       );
//                     }
//                       },
//                   child: Text("ORDER NOW"),
//                   textColor: Theme.of(context).primaryColor,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 6,
//             decoration: BoxDecoration(
//                 color: white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 7,
//                     offset: Offset(0, 3), // changes position of shadow
//                   ),
//                 ],
//                 borderRadius:
//                     BorderRadius.vertical(bottom: Radius.circular(30))),
//             child: Stack(
//               //mainAxisAlignment: MainAxisAlignment.center,
//               //crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   child: IconButton(
//                       icon: Icon(
//                         Icons.arrow_back,
//                         color: green,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       }),
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       "Cart",
//                       style: headingTextStyle(),
//                     )),
//               ],
//             ),
//           ),
//           /*Card(
//             margin: EdgeInsets.only(left: 15, top: 10, right: 15),
//             child: Container(
//               //height: EdgeInsets.all(8),
//               padding: EdgeInsets.all(8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         'Total :',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Chip(
//                         label: Text(
//                           "\$${receivedCart.results.checkout.cartTotals.cost.toStringAsFixed(2)}",
//                           style: TextStyle(
//                             color: white,
//                           ),
//                         ),
//                         backgroundColor: Theme.of(context).primaryColor,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                           "${receivedCart.results.checkout.cartTotals.items} items"),
//                     ],
//                   ),
//
//                   //Spacer(),
//                   FlatButton(
//                     *//*onPressed: () {
//                       Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.calculateTotal);
//                       cart.clearCart();
//                     },*//*
//                     child: Text("ORDER NOW"),
//                     textColor: Theme.of(context).primaryColor,
//                   )
//                 ],
//               ),
//             ),
//           ),*/
//           Container(
//             margin: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//
//                           Icon(Icons.delivery_dining, color: green,),
//                           Text("Delivery"),
//                         ],
//                       ),
//                       Switch(
//                         value: false,
//                         onChanged: (value) {},
//                       ),
//                       Column(
//                         children: [
//
//                           Icon(Icons.store, color: red,),
//                           Text("Pick Up"),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   //alignment: Alignment.centerRight,
//                   //margin: EdgeInsets.only(left: 15, top: 15, right: 15),
//                   child: FlatButton(
//                     color: red,
//                     child: Text(
//                       "Clear",
//                       style: TextStyle(color: white),
//                     ),
//                     onPressed: () => cart.clearCart(),
//                     //TODO get cart cleared API Call
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//
//             child: Expanded(
//               child: receivedCart.status != "Cart cartGet successful, "
//                   ? Container(
//                       child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.add,
//                           size: 30,
//                         ),
//                         Text("Nothing in cart"),
//                       ],
//                     ))
//                   : ListView.builder(
//                 padding: EdgeInsets.only(bottom: 100),
//                       itemBuilder: (ctx, index) {
//                         //cart.orders.length;
//                         //print("cart length ex: ${cart.orders.length}");
//                         return CartList(
//                           cartItemsDatum: receivedCart
//                               .results.checkout.cartItemsData[index],
//                         );
//                       },
//                       itemCount:
//                           receivedCart.results.checkout.cartItemsData.length,
//                     ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
    final cartProvider = Provider.of<CartProvider>(
        context, listen: false
    );
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final User user = userProvider.user;
    cartProvider.getCart("1", "${user.id}");
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: true);


    //cartProvider.getCart("1", "36");
    CartModel.Cart receivedCart = cartProvider.cart;

    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Please try again."),
      content: Text("There appears to be nothing in the cart."),
      actions: [
        okButton,
      ],
    );

    return Scaffold(
      floatingActionButton:  Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 25, top: 10,),
        child: Card(
          elevation: 2,
          //margin: EdgeInsets.only(left: 15, top: 10, right: 15),
          child: Container(

            //height: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Total :',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text(
                        "\$${receivedCart.results.checkout.cartTotals.cost.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                        "${receivedCart.results.checkout.cartTotals.items} items"),
                  ],
                ),

                //Spacer(),
                FlatButton(
                  onPressed: () {
                    if(receivedCart.results.checkout.cartTotals.items > 0){
                      changeScreenPush(context, CheckoutScreen(cart: receivedCart,));
                    }
                    else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  },
                  child: Text("ORDER NOW", overflow: TextOverflow.ellipsis,),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
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
                      "Cart",
                      style: headingTextStyle(),
                    )),
              ],
            ),
          ),
          /*Card(
            margin: EdgeInsets.only(left: 15, top: 10, right: 15),
            child: Container(
              //height: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total :',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Chip(
                        label: Text(
                          "\$${receivedCart.results.checkout.cartTotals.cost.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: white,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "${receivedCart.results.checkout.cartTotals.items} items"),
                    ],
                  ),

                  //Spacer(),
                  FlatButton(
                    *//*onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.calculateTotal);
                      cart.clearCart();
                    },*//*
                    child: Text("ORDER NOW"),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),*/
          Container(
            margin: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(

                  child: Row(
                    children: [
                      Column(
                        children: [

                          Icon(Icons.delivery_dining, color: green,),
                          Text("Delivery"),
                        ],
                      ),
                      Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Column(
                        children: [

                          Icon(Icons.store, color: red,),
                          Text("Pick Up"),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  //alignment: Alignment.centerRight,
                  //margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: FlatButton(
                    color: red,
                    child: Text(
                      "Clear",
                      style: TextStyle(color: white),
                    ),
                    onPressed: () => cart.clearCart(),
                    //TODO get cart cleared API Call
                  ),
                ),
              ],
            ),
          ),
          Container(

            child: Expanded(
              child: receivedCart.status != "Cart cartGet successful, "
                  ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 30,
                      ),
                      Text("Nothing in cart"),
                    ],
                  ))
                  : ListView.builder(
                padding: EdgeInsets.only(bottom: 100),
                itemBuilder: (ctx, index) {
                  //cart.orders.length;
                  //print("cart length ex: ${cart.orders.length}");
                  return CartList(
                    cartItemsDatum: receivedCart
                        .results.checkout.cartItemsData[index],
                  );
                },
                itemCount:
                receivedCart.results.checkout.cartItemsData.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
