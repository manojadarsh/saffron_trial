import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/providers/favoritesProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/screens/products/product_screen.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/screens/stores/storeDetails.dart';
import 'package:saffron_trial_10/widgets/rating_stars.dart';
import 'package:provider/provider.dart';

import '../../app_properties.dart';

class StoreTile extends StatelessWidget {
  // final Store store;
  // StoreItem({this.store});
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context, listen: true);
    final favProvider = Provider.of<FavoritesProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.user;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ProductScreen(
                    store: store,
                  ) //StoreDetails(store: store),
              )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: lightgreen,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey[200], width: 1.0)),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                  height: (MediaQuery.of(context).size.width - 125) / 2,
                  //width: (MediaQuery.of(context).size.width - 125) / 2,
                  fit: BoxFit.cover,
                  image: NetworkImage(store.imageUrl)),
            ),
            Positioned(
                right: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_outline,
                    color: red,
                  ),
                  onPressed: () {
                    favProvider.addToFavorites(context, user, store);
                  },
                )),
            Positioned(
              bottom: -5,
              child: Container(
                margin: EdgeInsets.all(12),
                child: Container(
                  //width: (MediaQuery.of(context).size.width - 110) / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(store.storeName,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: green,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: store.storeActive == 1 ? green : red,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ],
                      ),
                      RatingStars(store.rating),
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
                          */ /*setState(() {
                                  store.isFavorite = !store.isFavorite;
                                });
                                isInFavorite(store);*/ /*
                        },
                      ),
                    ),*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
