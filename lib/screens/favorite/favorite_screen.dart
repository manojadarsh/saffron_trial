import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saffron_trial_10/app_properties.dart';
import 'package:saffron_trial_10/models/favoriteStore.dart' as favModel;
import 'package:saffron_trial_10/models/user.dart';
import 'package:saffron_trial_10/providers/favoritesProvider.dart';
import 'package:saffron_trial_10/providers/userProvider.dart';
import 'package:saffron_trial_10/widgets/bottom_appBar.dart';
import 'package:saffron_trial_10/widgets/top_appBar.dart';


class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    super.initState();
    final favProvider = Provider.of<FavoritesProvider>(
        context, listen: false
    );
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final User user = userProvider.user;
    favProvider.getFavoriteStores("1", user);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final User user = userProvider.user;
    final favProvider = Provider.of<FavoritesProvider>(
        context, listen: true
    );
    final favStores = favProvider.favoriteStores;
    return Scaffold(
      body: Column(
          children: [
            TopAppBar(message: "Favorite Stores",),

            //Text("Favorite: ${favProvider.favoriteStores.length}"),

            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height/6 - 75,
                child: ListView.builder(itemCount: favStores.length,itemBuilder: (context, index) {
                  final favStore = favStores[index];
                  if (favStore.favouriteIndicator == 0){

                  }
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        color: favStore.favouriteIndicator == 0? red :white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey[200], width: 1.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                    height: (MediaQuery.of(context).size.width - 125) / 3,
                                    width: (MediaQuery.of(context).size.width - 125) / 3,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(favStore.imageUrl)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width - 50) / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(favStore.storeName,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis),
                                    Text(favStore.storeCategoryName,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        overflow: TextOverflow.ellipsis),
                                    //RatingStars(favStore.rating),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: () {

                              setState(() {
                                favProvider.removeFromFavorites(context, user, favStore);
                              });
                            }
                            ,icon: Icon(Icons.cancel, color: grey,),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),



          ],
        ),
bottomNavigationBar:      BottomBar(),
    );
  }
}
