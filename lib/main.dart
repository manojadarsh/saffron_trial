import 'package:flutter/material.dart';
import 'package:saffron_trial_10/providers/Checkout/addressProvider.dart';
import 'package:saffron_trial_10/providers/authProvider.dart';
import 'package:saffron_trial_10/providers/carts.dart';
import 'package:saffron_trial_10/providers/cartsProvider.dart';
import 'package:saffron_trial_10/providers/categories.dart';
import 'package:saffron_trial_10/providers/dateSlotProvider.dart';
import 'package:saffron_trial_10/providers/deliveryTypeProvider.dart';
import 'package:saffron_trial_10/providers/favoritesProvider.dart';
import 'package:saffron_trial_10/providers/ordersProvider.dart';
import 'package:saffron_trial_10/providers/pastOrdersProvider.dart';
import 'package:saffron_trial_10/providers/products.dart';
import 'package:saffron_trial_10/providers/stores.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/splashScreen.dart';
import 'package:provider/provider.dart';

import 'app_properties.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Categories()),
        ChangeNotifierProvider(create: (context) => Stores()),
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Carts()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrdersProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => DateSlotsProvider()),
        ChangeNotifierProvider(create: (context) => SlotProvider()),
        ChangeNotifierProvider(create: (context) => DeliveryTypeProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => PastOrdersProvider()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        //CategoryScreen(),
        //HomePage2(),
      ),
    );
  }
}
