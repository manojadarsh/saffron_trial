import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/providers/cartsProvider.dart';
import 'package:saffron_trial_10/providers/favoritesProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/screens/cart/cartScreen.dart';
import 'package:saffron_trial_10/screens/cart/cart_screen.dart';
import 'package:saffron_trial_10/screens/category/category_screen.dart';
import 'package:saffron_trial_10/screens/favorite/favoriteScreen.dart';
import 'package:saffron_trial_10/screens/favorite/favorite_screen.dart';
import 'package:saffron_trial_10/screens/settings/settings.dart';

import '../app_properties.dart';

//flexible fit Flexfit tight
class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  @override
  void initState() {
    super.initState();
    final cartProvider = Provider.of<CartProvider>(
        context, listen: false
    );
    final favProvider = Provider.of<FavoritesProvider>(
        context, listen: false
    );
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final User user = userProvider.user;
    favProvider.getFavoriteStores("1", user);
    cartProvider.getCart("1", "${user.id.toString()}");
    print("init: ${cartProvider.cartCount}");
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoritesProvider>(context);
    print("favpro: ${favoriteProvider.favoriteCount}");
    //int cartCount = cartProvider.cartCount;
    //print("hello hi ${cartProvider.cartCount}");
    return BottomAppBar(
      elevation: 5,
      child: Container(
        height: 75,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => CategoryScreen()));
              },
              child: Flexible(
                child: Container(
                  width: (MediaQuery.of(context).size.width / 5) - 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.red,
                      ),
                      Text(
                        "Home",
                        style: bottomAppBarText(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                changeScreenPush(context, FavoriteScreen());
              },
              child: Container(
                width: (MediaQuery.of(context).size.width / 5) - 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: red,
                        ),
                        Positioned(
                          child: Container(
                              alignment: Alignment.center,
                              height: 13,
                              width: 13,
                              decoration: BoxDecoration(
                                  //color: ,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(favoriteProvider.favoriteCount == null ? " 0" :favoriteProvider.favoriteCount.toString(), style: textFieldStyleSizeColor(10, white),)),
                        )
                      ],
                    ),
                    Text(
                      "Favorites",
                      style: bottomAppBarText(),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   width: (MediaQuery.of(context).size.width / 5) - 10,
            //   height: (MediaQuery.of(context).size.width / 5) - 10,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30), color: green),
            //   child: IconButton(
            //     icon: Icon(
            //       Icons.add,
            //       color: white,
            //       size: 40,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              child: Container(
                width: (MediaQuery.of(context).size.width / 5) - 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Consumer<CartProvider>(
                    //   builder: (context, cartPro, child) => Stack(
                    //     children: [
                    //       child,
                    //       Positioned(
                    //         right: -1,
                    //         top: -1,
                    //         child: Container(
                    //           alignment: Alignment.center,
                    //             height: 15,
                    //             width: 15,
                    //             decoration: BoxDecoration(
                    //               color: green,
                    //                 borderRadius: BorderRadius.circular(15)),
                    //             child: Text(cartPro.cartCount.toString(), style: textFieldStyleSizeColor(6, white),)),
                    //       )
                    //     ],
                    //   ),
                    //   child: Icon(
                    //     Icons.shopping_cart,
                    //     color: grey,
                    //   ),
                    // ),

                    Stack(
                      children: [
                      Icon(
                      Icons.shopping_cart,
                      color: grey,
                    ),
                        Positioned(
                          right: 1,
                          top: 1,
                          child: Container(
                              alignment: Alignment.center,
                              height: 13,
                              width: 13,
                              decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(cartProvider.cartCount == null ? " 0" :cartProvider.cartCount.toString(), style: textFieldStyleSizeColor(6, white),)),
                        )
                      ],
                    ),

                    // Stack(
                    //   children: [
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(15),
                    //           color: green),
                    //       child: Text("hi"),
                    //     ),
                    //     Icon(
                    //       Icons.shopping_cart,
                    //       color: Colors.grey,
                    //     ),
                    //   ],
                    // ),
                    Text(
                      "Cart",
                      style: bottomAppBarText(),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Settings()));
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    Text(
                      "Settings",
                      style: bottomAppBarText(),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
