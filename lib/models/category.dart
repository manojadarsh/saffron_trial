// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:saffron_trial_10/models/store.dart';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category with ChangeNotifier{
  Category({
    this.id,
    this.instanceId,
    this.versionNo,
    this.appId,
    this.storeCategoryId,
    this.storeCategoryName,
    this.imageUrl,
    this.minCartAmount,
    this.maxCartAmount,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
  });

  int id;
  int instanceId;
  int versionNo;
  int appId;
  int storeCategoryId;
  String storeCategoryName;
  String imageUrl;
  int minCartAmount;
  int maxCartAmount;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;
  List<Store> stores = [];

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    instanceId: json["instance_id"],
    versionNo: json["version_no"],
    appId: json["app_id"],
    storeCategoryId: json["store_category_id"],
    storeCategoryName: json["store_category_name"],
    imageUrl: json["image_url"],
    minCartAmount: json["min_cart_amount"],
    maxCartAmount: json["max_cart_amount"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "instance_id": instanceId,
    "version_no": versionNo,
    "app_id": appId,
    "store_category_id": storeCategoryId,
    "store_category_name": storeCategoryName,
    "image_url": imageUrl,
    "min_cart_amount": minCartAmount,
    "max_cart_amount": maxCartAmount,
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
  };


  void setStores(List<Store> newStores){
    stores = newStores;
    notifyListeners();
}
}
