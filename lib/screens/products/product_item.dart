import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/carts.dart';
import 'package:saffron_trial_10/providers/cartsProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';

import 'package:provider/provider.dart';
import 'package:saffron_trial_10/screens/products/product_details.dart';

import '../../app_properties.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Carts>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.user;
    final cartProvider = Provider.of<CartProvider>(context);


   // print(product.imageUrl);

    return Container(
      margin: EdgeInsets.all(0),
      height: (MediaQuery.of(context).size.width-10)/2,
      width: (MediaQuery.of(context).size.width-50)/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Center(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProdDetails(product: product,)
                      //ProductDetails(product: product, store: product.storeId,),
              )),
              child: Column(
                children: [

                  Container(
                    margin: EdgeInsets.all(5),
                    height: (MediaQuery.of(context).size.width-50)/2-40,
                    width: (MediaQuery.of(context).size.width-50)/2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl,),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 2, left: 7, right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: (MediaQuery.of(context).size.width-50)/4,
                          child: Text(
                            "${product.productName}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.8,
                                color: Colors.grey), overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "\$${product.price}/",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.8,
                              color: green),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 7, right: 7),
                    alignment: Alignment.centerRight,
                    child: Text("${product.productUnit}${product.productUnitName}", textAlign: TextAlign.start, style: TextStyle(
                        color: green,
                        fontSize: 10
                    ),),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 1,
              right: 3,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      product.setOrderQty(product.orderQty + 1);
                      //print(product.orderQty);
                      //print(product.companyId);
                      cartProvider.addToCart(context,product, product.orderQty, user);
                      print("cart totals ${cartProvider.cart.results.checkout.cartTotals.items}");

                    }),
              ),
            ),
            Positioned(
              top: 1,
              right: 50,
              child: product.orderQty == 0 ? Container() : Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 15,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      product.setOrderQty(product.orderQty -1 );
                      print(product.orderQty);
                      cartProvider.addToCart(context,product, product.orderQty, user);

                    }),
              ),
            ),
            Positioned(
                top: 7,
                right: 37,
                child: product.orderQty == 0 ? Container() :Text("${product.orderQty}"))
          ],
        ),
      ),
    );
  }
}
