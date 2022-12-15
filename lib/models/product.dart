// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product with ChangeNotifier {
  Product({
    this.orderQty,
    this.orderCost,
    this.orderDiscount,
    this.sno,
    this.currency,
    this.store,
    this.qty,
    this.id,
    this.instanceId,
    this.versionNo,
    this.appId,
    this.companyId,
    this.brandId,
    this.storeId,
    this.productId,
    this.productSku,
    this.productName,
    this.productUnitName,
    this.productUnit,
    this.productDescription,
    this.priceEffectiveDate,
    this.discountEffectiveDate,
    this.pieces,
    this.weight,
    this.price,
    this.discountPrice,
    this.currencyId,
    this.stock,
    this.orderStock,
    this.rating,
    this.productCategoryId,
    this.imageUrl,
    this.productFavorite,
    this.discountEndDate,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
    this.imageUrl4,
    this.imageUrl5,
    this.productFilterCriteria1,
    this.productFilterCriteria2,
    this.productFilterCriteria3,
    this.inputSource,
    this.inputUserid,
    this.requestId,
    this.statusIndicator,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
    this.appName,
    this.storeName,
    this.storeActive,
    this.storeResumeHours,
    this.storeCategoryId,
    this.storeCategoryName,
    this.brandName,
    this.companyName,
    this.productCategoryName,
    this.category,
  });

  int orderQty;
  int orderCost;
  int orderDiscount;
  int sno;
  String currency;
  String store;
  int qty;
  int id;
  int instanceId;
  int versionNo;
  int appId;
  int companyId;
  int brandId;
  int storeId;
  int productId;
  String productSku;
  String productName;
  String productUnitName;
  int productUnit;
  String productDescription;
  DateTime priceEffectiveDate;
  DateTime discountEffectiveDate;
  int pieces;
  double weight;
  double price;
  double discountPrice;
  int currencyId;
  int stock;
  int orderStock;
  int rating;
  int productCategoryId;
  String imageUrl;
  int productFavorite;
  DateTime discountEndDate;
  String imageUrl1;
  String imageUrl2;
  String imageUrl3;
  String imageUrl4;
  String imageUrl5;
  int productFilterCriteria1;
  int productFilterCriteria2;
  int productFilterCriteria3;
  dynamic inputSource;
  int inputUserid;
  dynamic requestId;
  int statusIndicator;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;
  String appName;
  String storeName;
  int storeActive;
  DateTime storeResumeHours;
  int storeCategoryId;
  String storeCategoryName;
  String brandName;
  String companyName;
  String productCategoryName;
  String category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    orderQty: json["order_qty"],
    orderCost: json["order_cost"],
    orderDiscount: json["order_discount"],
    sno: json["sno"],
    currency: json["currency"],
    store: json["store"],
    qty: json["qty"],
    id: json["id"],
    instanceId: json["instance_id"],
    versionNo: json["version_no"],
    appId: json["app_id"],
    companyId: json["company_id"],
    brandId: json["brand_id"],
    storeId: json["store_id"],
    productId: json["product_id"],
    productSku: json["product_sku"],
    productName: json["product_name"],
    productUnitName: json["product_unit_name"],
    productUnit: json["product_unit"],
    productDescription: json["product_description"],
    priceEffectiveDate: DateTime.parse(json["price_effective_date"]),
    discountEffectiveDate: DateTime.parse(json["discount_effective_date"]),
    pieces: json["pieces"],
    weight: json["weight"].toDouble(),
    price: json["price"].toDouble(),
    discountPrice: json["discount_price"].toDouble(),
    currencyId: json["currency_id"],
    stock: json["stock"],
    orderStock: json["order_stock"],
    rating: json["rating"],
    productCategoryId: json["product_category_id"],
    imageUrl: json["image_url"],
    productFavorite: json["product_favorite"],
    discountEndDate: DateTime.parse(json["discount_end_date"]),
    imageUrl1: json["image_url_1"],
    imageUrl2: json["image_url_2"],
    imageUrl3: json["image_url_3"],
    imageUrl4: json["image_url_4"],
    imageUrl5: json["image_url_5"],
    productFilterCriteria1: json["product_filter_criteria_1"],
    productFilterCriteria2: json["product_filter_criteria_2"],
    productFilterCriteria3: json["product_filter_criteria_3"],
    inputSource: json["input_source"],
    inputUserid: json["input_userid"],
    requestId: json["request_id"],
    statusIndicator: json["status_indicator"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
    appName: json["app_name"],
    storeName: json["store_name"],
    storeActive: json["store_active"],
    storeResumeHours: DateTime.parse(json["store_resume_hours"]),
    storeCategoryId: json["store_category_id"],
    storeCategoryName: json["store_category_name"],
    brandName: json["brand_name"],
    companyName: json["company_name"],
    productCategoryName: json["product_category_name"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "order_qty": orderQty,
    "order_cost": orderCost,
    "order_discount": orderDiscount,
    "sno": sno,
    "currency": currency,
    "store": store,
    "qty": qty,
    "id": id,
    "instance_id": instanceId,
    "version_no": versionNo,
    "app_id": appId,
    "company_id": companyId,
    "brand_id": brandId,
    "store_id": storeId,
    "product_id": productId,
    "product_sku": productSku,
    "product_name": productName,
    "product_unit_name": productUnitName,
    "product_unit": productUnit,
    "product_description": productDescription,
    "price_effective_date": priceEffectiveDate.toIso8601String(),
    "discount_effective_date": discountEffectiveDate.toIso8601String(),
    "pieces": pieces,
    "weight": weight,
    "price": price,
    "discount_price": discountPrice,
    "currency_id": currencyId,
    "stock": stock,
    "order_stock": orderStock,
    "rating": rating,
    "product_category_id": productCategoryId,
    "image_url": imageUrl,
    "product_favorite": productFavorite,
    "discount_end_date": discountEndDate.toIso8601String(),
    "image_url_1": imageUrl1,
    "image_url_2": imageUrl2,
    "image_url_3": imageUrl3,
    "image_url_4": imageUrl4,
    "image_url_5": imageUrl5,
    "product_filter_criteria_1": productFilterCriteria1,
    "product_filter_criteria_2": productFilterCriteria2,
    "product_filter_criteria_3": productFilterCriteria3,
    "input_source": inputSource,
    "input_userid": inputUserid,
    "request_id": requestId,
    "status_indicator": statusIndicator,
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
    "app_name": appName,
    "store_name": storeName,
    "store_active": storeActive,
    "store_resume_hours": storeResumeHours.toIso8601String(),
    "store_category_id": storeCategoryId,
    "store_category_name": storeCategoryName,
    "brand_name": brandName,
    "company_name": companyName,
    "product_category_name": productCategoryName,
    "category": category,
  };
  void setOrderQty(int desiredQuantity){
    orderQty = desiredQuantity;
    notifyListeners();
  }
}
