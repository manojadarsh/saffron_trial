// To parse this JSON data, do
//
//     final cartProduct = cartProductFromJson(jsonString);

import 'dart:convert';

CartProduct cartProductFromJson(String str) => CartProduct.fromJson(json.decode(str));

String cartProductToJson(CartProduct data) => json.encode(data.toJson());

class CartProduct {
  CartProduct({
    this.appId,
    this.companyId,
    this.brandId,
    this.storeId,
    this.storeName,
    this.productDescription,
    this.productName,
    this.imageUrl,
    this.unit,
    this.productUnitName,
    this.productSku,
    this.productId,
    this.qty,
    this.price,
    this.discount,
    this.weight,
    this.promoCode,
    this.requestId,
    this.userId,
    this.orderQty,
    this.cost,
    this.orderCost,
    this.orderDiscount,
    this.uniqueRequestId,
  });

  int appId;
  int companyId;
  int brandId;
  int storeId;
  String storeName;
  String productDescription;
  String productName;
  String imageUrl;
  int unit;
  String productUnitName;
  String productSku;
  String productId;
  int qty;
  double price;
  int discount;
  double weight;
  dynamic promoCode;
  String requestId;
  int userId;
  int orderQty;
  double cost;
  dynamic orderCost;
  dynamic orderDiscount;
  String uniqueRequestId;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    appId: json["app_id"],
    companyId: json["company_id"],
    brandId: json["brand_id"],
    storeId: json["store_id"],
    storeName: json["store_name"],
    productDescription: json["product_description"],
    productName: json["product_name"],
    imageUrl: json["image_url"],
    unit: json["unit"],
    productUnitName: json["product_unit_name"],
    productSku: json["product_sku"],
    productId: json["product_id"],
    qty: json["qty"],
    price: json["price"].toDouble(),
    discount: json["discount"],
    weight: json["weight"].toDouble(),
    promoCode: json["promo_code"],
    requestId: json["request_id"],
    userId: json["user_id"],
    orderQty: json["order_qty"],
    cost: json["cost"].toDouble(),
    orderCost: json["order_cost"],
    orderDiscount: json["order_discount"],
    uniqueRequestId: json["uniqueRequestId"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "company_id": companyId,
    "brand_id": brandId,
    "store_id": storeId,
    "store_name": storeName,
    "product_description": productDescription,
    "product_name": productName,
    "image_url": imageUrl,
    "unit": unit,
    "product_unit_name": productUnitName,
    "product_sku": productSku,
    "product_id": productId,
    "qty": qty,
    "price": price,
    "discount": discount,
    "weight": weight,
    "promo_code": promoCode,
    "request_id": requestId,
    "user_id": userId,
    "order_qty": orderQty,
    "cost": cost,
    "order_cost": orderCost,
    "order_discount": orderDiscount,
    "uniqueRequestId": uniqueRequestId,
  };
}
