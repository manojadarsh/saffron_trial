import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/screens/products/product_screen.dart';
import 'package:saffron_trial_10/screens/stores/storeDetails.dart';
import 'package:saffron_trial_10/widgets/rating_stars.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class StoreItem extends StatelessWidget {
  // final Store store;
  // StoreItem({this.store});
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context, listen: true);
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductScreen(store: store,)//StoreDetails(store: store),
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
                  height: (MediaQuery.of(context).size.width - 125) / 2,
                  width: (MediaQuery.of(context).size.width - 125) / 2,
                  fit: BoxFit.cover,
                  image: NetworkImage(store.imageUrl)),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width - 110) / 2,
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
                  /*Consumer<Store>(
                    builder: (context, store, _) => IconButton(
                      color: green,
                      icon: (store.isFavorite
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border)),
                      onPressed: () {
                        store.toggleFavoriteStatus();
                        print(store.isFavorite);
                        print("hello");
                        *//*setState(() {
                                store.isFavorite = !store.isFavorite;
                              });
                              isInFavorite(store);*//*
                      },
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
