import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/product.dart';
import 'package:saffron_trial_10/providers/carts.dart';
import 'package:saffron_trial_10/providers/cartsProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/models/user.dart';

class ProductListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Carts>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.user;
    final cartProvider = Provider.of<CartProvider>(context);


    return Container(
        height: 152,
        margin: EdgeInsets.all(10),
        width: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.grey[50])),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  height: 100.0,
                  //width: 100.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(product.imageUrl),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "${product.productName}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("${product.rating} + ⭐",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis),
                      Text("\$${product.price}",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {

                        }),
                    margin: EdgeInsets.only(right: 20),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
