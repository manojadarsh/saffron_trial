import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/favoriteStore.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';


class FavoritesProvider with ChangeNotifier {



  String addToFavoritesURL = "http://shopfreshlii.a3jm.com:3050/accounts/update-store-favorites";


  var uuid = Uuid();



  int _favoriteCount;
  //int _favoriteCount = _cart.results.checkout.cartTotals.items;

  int get favoriteCount {
    return _favoriteCount;
  }

  List<Datum> _favoriteStores = [];

  List<Datum> get favoriteStores => _favoriteStores;

  List<Datum> currentFavoriteStores() {
    List<Datum> stores;
    for (int i; i < _favoriteStores.length; i++) {

    }
    return stores;
}

  FavoriteStore _favStore = FavoriteStore();

  FavoriteStore get favStore => _favStore;

  void addToFavorites(
      BuildContext context, User user, Store store) async {

    DateTime now = DateTime.now();
    var result;
    print(user.id);
    final Map<String, dynamic> favoriteStoreData = {
      "request_id": "${uuid.v4().toString()}",
      "app_id": 1,
      "user_id": user.id,
      "company_id": store.companyId,
      "brand_id": store.brandId,
      "store_id": store.storeId,
      "favourite_indicator": 1,
      "ts": "$now"
    };



    http.Response response = await http.post(addToFavoritesURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(favoriteStoreData));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      //print(responseData);
      //showProductStatusSnackBar(context, cartStatus, responseData);
      //showProductStatusDialog(context, _cartStatus, responseData);
      notifyListeners();
      //print(responseData);
    } else {
      print("didn't add");
    }
  }

  void removeFromFavorites(
      BuildContext context, User user, Datum store) async {

    DateTime now = DateTime.now();
    var result;
    print(user.id);
    final Map<String, dynamic> favoriteStoreData = {
      "request_id": "${uuid.v4().toString()}",
      "app_id": 1,
      "user_id": user.id,
      "company_id": store.companyId,
      "brand_id": store.brandId,
      "store_id": store.storeId,
      "favourite_indicator": 0,
      "ts": "$now"
    };



    http.Response response = await http.post(addToFavoritesURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(favoriteStoreData));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      //showProductStatusSnackBar(context, cartStatus, responseData);
      //showProductStatusDialog(context, _cartStatus, responseData);
      notifyListeners();
      print(responseData);
    } else {
      print("didn't add");
    }
  }

  Future<FavoriteStore> getFavoriteStores(String appId, User user) async {

    //print(appId);
    //print(user.id);
    final queryParameters = {"app_id": appId, "user_id": "${user.id.toString()}"};
    print(queryParameters);
    try {
      //TODO this is the issue - must fix.
      final uri =
      Uri.http("shopfreshlii.a3jm.com:3050", '/accounts/get-store-favorites', queryParameters);
      print(uri);
      final response = await http.get(uri);
      //print(response.statusCode);
      //print(response.body);
      if (response.statusCode == 200) {
        final FavoriteStore favStore = favoriteStoreFromJson(response.body);
        print("hi");
        _favStore = favStore;
        print(favStore.toJson());
        _favoriteCount = await favStore.response.rows.first.storeFavorites.count;
        _favoriteStores = await favStore.response.rows.first.storeFavorites.data;
        _favoriteStores.sort((b, a) => a.favouriteIndicator.compareTo(b.favouriteIndicator));
        print("provider favor${_favoriteCount}");
        //print(_stores);
        //print("lenght: ${_cart.status}");
        //check if this is correct
        notifyListeners();
        //return stores;
        print(_favStore.response.toJson());
      } else {
        print("error1");
        return FavoriteStore();
      }
    } catch (e) {
      print(e.toString());
      return FavoriteStore();
    }
    //notifyListeners();
    //print(_cart);
  }

}