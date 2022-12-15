import 'package:flutter/material.dart';
import 'package:saffron_trial_10/models/category.dart';
import 'package:saffron_trial_10/models/store.dart';
import 'package:saffron_trial_10/providers/products.dart';
import 'package:saffron_trial_10/providers/stores.dart';
import 'package:saffron_trial_10/screens/category/categoryServices.dart';
import 'package:http/http.dart' as http;

class Categories with ChangeNotifier {

  static const String categoryURL = 'http://192.168.0.188:3000/v2/categories';

  Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(categoryURL);
      if (response.statusCode == 200) {
        final List<Category> categories = categoryFromJson(response.body);
        var length = categories.length;
        c_length = length;
        print("$length");
        _categories = categories;
        Category cat;
        // for(cat in _categories) {
        //   cat.stores = Stores().stores(cat.storeCategoryName);
        //   //print(cat.s)
        // }
        notifyListeners();
        ////return _categories;

      } else {
        return List<Category>();
      }
    } catch (e) {
      return List<Category>();
    }
  }

  List<Category> _categories = [];

  List<Category> get categories {
    if(_categories.isEmpty) {
      getCategories();
    }
    //getCategories();
    //print(_categories.first.storeCategoryName);
    //print(_categories.first.stores.first.products.first.storeId);
    //notifyListeners();
    return _categories;
  }
}