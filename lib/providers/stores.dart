import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/providers/products.dart';
import 'package:http/http.dart' as http;

class Stores with ChangeNotifier {

  var s_length;

  Future<List<Store>> getStores(String storeCatName) async {
    final queryParameters = {
      "store_category_name": storeCatName,
    };
    try {
      //TODO this is the issue - must fix.
      final uri = Uri.http("192.168.0.188:3000", '/v2/stores', queryParameters);
      //print(uri);
      final response = await http.get(uri);
      //print(response.statusCode);
      //print(response.body);
      if (response.statusCode == 200) {
        final List<Store> stores = storeFromJson(response.body);
        _stores = stores;
        //print(_stores);
        print("lenght: ${_stores.length}");
        Store store;
        // for(store in _stores) {
        //   store.products = Products().products(store.storeId);
        // }for(store in _stores) {
        //   store.products = Products().products(store.storeId);
        // }
        //check if this is correct
        notifyListeners();
        //return stores;

      } else {
        print("error1");
        return List<Store>();
      }
    } catch (e) {
      print(e.toString());
      return List<Store>();
    }
    //notifyListeners();
    print(_stores);
  }


  Future<List<Store>> getStoresByNameCat(String storeCatName, String storeName) async {
    final queryParameters = {
      "store_category_name": storeCatName,
      "store_name" : storeName,
    };
    try {
      //TODO this is the issue - must fix.
      final uri = Uri.http("192.168.0.188:3000", '/v2/stores', queryParameters);
      //print(uri);
      final response = await http.get(uri);
      //print(response.statusCode);
      //print(response.body);
      if (response.statusCode == 200) {
        final List<Store> stores = storeFromJson(response.body);
        _storesByNameCat = stores;
        //print(_stores);
        //print("lenght: ${_stores.length}");
        Store store;
        // for(store in _stores) {
        //   store.products = Products().products(store.storeId);
        // }for(store in _stores) {
        //   store.products = Products().products(store.storeId);
        // }
        //check if this is correct
        notifyListeners();
        //return stores;

      } else {
        print("error1");
        return List<Store>();
      }
    } catch (e) {
      print(e.toString());
      return List<Store>();
    }
    //notifyListeners();
    print(_storesByNameCat);
  }

  List<Store> get favoriteItems {
    //return _stores.where((storeItem) => storeItem.isFavorite).toList();
  }

  bool isNotFull(){
    if (_stores.isEmpty){
      return true;
    } else {
      return false;
    }
  }

  int get numberOfStores{
    return s_length;
  }

  List<Store> _storesByNameCat = [];

  List<Store> get storesByNameCat => _storesByNameCat;

  List<Store> _stores = [];

  List<Store> stores (String storeCatName){

    getStores(storeCatName);
    //print("cpp; + $s_length");
    //notifyListeners();
    return _stores;
  }

  List<Store> get storeNoParam => _stores;

}