/*
import 'package:flutter/material.dart';
import 'package:freshlii_trial8/models/order_item.dart';
import 'package:freshlii_trial8/models/product.dart';
import 'package:freshlii_trial8/screens/stores/storeDetails.dart';
import 'package:freshlii_trial8/services/bloc/cart_bloc.dart';


class CartScreen1 extends StatefulWidget {
  @override
  _CartScreen1State createState() => _CartScreen1State();
}

class _CartScreen1State extends State<CartScreen1> {
  _buildCartItem(Product product) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Expanded(
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: NetworkImage(product.imageUrl),
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${product.productName}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${product.storeName}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.8, color: Colors.black54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print("decerease");
                            },
                            child: Text(
                              "-",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          //Text("${product.desiredQuantity.toString()}"),
                          GestureDetector(
                            onTap: () {
                              //increaseQuantity(order);
                              print("increase");
                            },
                            child: Text(
                              "+",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: Text(
                "\$${product.desiredQuantity * product.price}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    blocCart.cartItems.forEach((Product product) {
      totalPrice += product.desiredQuantity * product.price;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart (${blocCart.cartItems.length})"),
      ),
      body: ListView.separated(
        itemCount: blocCart.cartItems.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < blocCart.cartItems.length) {
            Product product = blocCart.cartItems[index];
            return _buildCartItem(product);
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Estimated Delivery Time:", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),),
                    Text("25 min",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,),),
                  ],),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total Price:", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),),
                    Text('\$$totalPrice',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,),),
                  ],),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))
        ),
        width: MediaQuery.of(context).size.width,

        child: Center(
          child: FlatButton(
            onPressed: () {},
            child: Text("Checkout", style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500
            ),),
          ),
        ),
      ),
    );
  }
}
*/
