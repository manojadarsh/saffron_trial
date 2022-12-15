import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/cartsProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/products/product_list.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';
import 'package:saffron_trial_10/widgets/rating_stars.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class ProdDetails extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController quantityTEC = new TextEditingController();

  final Product product;
  int minQuantity = 2;
  int maxQuantity = 7;
  int quantity = 1;
  NumberPicker integerNumberPicker;
  ProdDetails({this.product});
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.user;

    Future _showIntDialog() async {
      await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 0,
            maxValue: 25,
            step: 1,
            initialIntegerValue: quantity,
          );
        },
      ).then((num value) {
        if (value != null) {
          quantity = value;
          integerNumberPicker.animateInt(value);
        }
      });
    }

    addToCartDialog(Product product) {
      Widget cancelButton = FlatButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      );
      Widget addToCart = FlatButton(
        child: Text("Add to Cart"),
        onPressed: () async {
          print(quantity);
          if (_formKey.currentState.validate()) {
            print("add to cart");
            cartProvider.addToCart(
                context, product, quantity, user);
          }

        },
      );
      AlertDialog alertDialog = AlertDialog(
        title: Text("Select Desired Quantity"),
        content: Container(
          height: 200,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                FlatButton(
                    onPressed: () {
                      //_showIntDialog();
                    },
                    child: Row(
                      children: [
                        Text(
                          "Quantity ($quantity)",
                          style: TextStyle(),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    child: TextFormField(
                      validator: (val) {
                        quantity = int.parse(val);
                        return quantity.isNaN ||
                                quantity < minQuantity ||
                                quantity > maxQuantity
                            ? "Please select a quantity within the limits"
                            : null;
                      },
                      controller: quantityTEC,
                      keyboardType: TextInputType.number,
                      style: textFieldStyle(),
                      decoration: textFieldInputDecoration(
                          "Quantity",
                          Icons.confirmation_number_outlined,
                          MediaQuery.of(context).size.height),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          cancelButton,
          addToCart
          //confirmLogout,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alertDialog;
          });
    }

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                child: Image(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    image: NetworkImage(product.imageUrl)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        iconSize: 30,
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.pop(context)),
                    /*IconButton(
                        iconSize: 30,
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.favorite),
                        onPressed: () {}),*/
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      product.productName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   margin: EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //       color: lightgreen, borderRadius: BorderRadius.circular(15)),
              //   alignment: Alignment.center,
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Text(
              //         product.productName,
              //         style: TextStyle(
              //           fontSize: 20,
              //           color: Colors.grey,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       FlatButton(
              //           onPressed: () {
              //             //_showIntDialog();
              //           },
              //           child: Row(
              //             children: [
              //               Text(
              //                 "Quantity ()",
              //                 style: TextStyle(),
              //               ),
              //               Icon(
              //                 Icons.arrow_drop_down,
              //                 size: 25,
              //               ),
              //             ],
              //           )),
              //       Text(
              //         "",
              //         style: TextStyle(fontSize: 16, color: Colors.grey),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RatingStars(product.rating),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  product.store.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  addToCartDialog(product);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(35)),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: lightgreen,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Other Items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Expanded(
            child: (Container(
                height: 125,
                child: ProductList(
                  product: product,
                ))),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
