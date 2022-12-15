/*
import 'package:flutter/material.dart';
import 'package:freshlii_trial8/screens/cart/cartScreen.dart';
import 'package:freshlii_trial8/services/bloc/cart_bloc.dart';
import 'package:freshlii_trial8/services/bloc/favorite_bloc.dart';
import 'package:freshlii_trial8/models/category.dart';
import 'package:freshlii_trial8/models/store.dart';
import 'package:freshlii_trial8/screens/stores/storeDetails.dart';
import 'package:freshlii_trial8/screens/stores/storeServices.dart';
import 'package:freshlii_trial8/widgets/rating_stars.dart';

import '../../app_properties.dart';

class FavoritesScreen extends StatefulWidget {

  FavoritesScreen();
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool _isloading = true;


  _removeFromFavorites(Store store){
    setState(() {
      //store.isFavorite = false;
      blocFavorites.removeFromFavorites(store);
    });
  }

  _buildStores() {
    List<Widget> storeList = [];
    blocFavorites.favoriteItems.forEach((Store store) {
      storeList.add(GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => StoreDetails(store: store),
            )),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[200], width: 1.0)),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                    height: (MediaQuery.of(context).size.width-125)/2,
                    width: (MediaQuery.of(context).size.width-125)/2,
                    fit: BoxFit.cover,
                    image: NetworkImage(store.imageUrl)),

              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width-110)/2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(store.storeName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis),
                          RatingStars(store.rating),
                          Text(store.storeActive.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis),
                          Text(
                            "0.2 miles away",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                        color: green,
                        icon: (*/
/*store.isFavorite ? Icon(Icons.favorite) : *//*
Icon(Icons.favorite_border)),
                        onPressed: () {
                          // _removeFromFavorites(store);
                        },
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ));
    });
    return Column(
      children: storeList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle_outlined),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: Text("Grocery Delivery"),
        actions: <Widget>[FlatButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen1()));
        }, child:
        Row(
          children: [
            Text("Cart", style: TextStyle(
              color: white,
            ),),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.shopping_cart, size: 15,color: white,),
          ],
        ))],
      ),
      body: ListView(
        children: [
          //Search Bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[50],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                hintText: "Search For Stores",
                prefixIcon: Icon(Icons.search, size: 30),
                suffixIcon: Icon(Icons.cancel, size: 30),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Nearby Stores",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      letterSpacing: 1.2),
                ),
              ),
              _buildStores(),
            ],
          ),

        ],
      ),
    );
  }
}*/
