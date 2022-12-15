// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.status,
    this.results,
  });

  String status;
  Results results;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    status: json["status"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results.toJson(),
  };
}

class Results {
  Results({
    this.processTime,
    this.checkout,
    this.cartsData,
  });

  String processTime;
  Checkout checkout;
  CartsData cartsData;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    processTime: json["processTime"],
    checkout: Checkout.fromJson(json["checkout"]),
    cartsData: CartsData.fromJson(json["cartsData"]),
  );

  Map<String, dynamic> toJson() => {
    "processTime": processTime,
    "checkout": checkout.toJson(),
    "cartsData": cartsData.toJson(),
  };
}

class CartsData {
  CartsData({
    this.appId,
    this.userId,
    this.items,
  });

  String appId;
  String userId;
  List<List<CartsDataItem>> items;

  factory CartsData.fromJson(Map<String, dynamic> json) => CartsData(
    appId: json["appId"],
    userId: json["userId"],
    items: List<List<CartsDataItem>>.from(json["items"].map((x) => List<CartsDataItem>.from(x.map((x) => CartsDataItem.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "appId": appId,
    "userId": userId,
    "items": List<dynamic>.from(items.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class CartsDataItem {
  CartsDataItem({
    this.cartId,
    this.instanceId,
    this.versionNo,
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
    this.discountPrice,
    this.weight,
    this.promoCode,
    this.requestId,
    this.userId,
    this.status,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
    this.image1,
    this.imageLogoSmall,
    this.storeCategoryId,
    this.storeDeliveryType,
  });

  int cartId;
  int instanceId;
  int versionNo;
  int appId;
  int companyId;
  int brandId;
  int storeId;
  String storeName;
  String productDescription;
  String productName;
  String imageUrl;
  dynamic unit;
  String productUnitName;
  String productSku;
  String productId;
  int qty;
  double price;
  dynamic discountPrice;
  double weight;
  dynamic promoCode;
  String requestId;
  int userId;
  int status;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;
  String image1;
  String imageLogoSmall;
  int storeCategoryId;
  int storeDeliveryType;

  factory CartsDataItem.fromJson(Map<String, dynamic> json) => CartsDataItem(
    cartId: json["cart_id"],
    instanceId: json["instance_id"],
    versionNo: json["version_no"],
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
    discountPrice: json["discount_price"],
    weight: json["weight"].toDouble(),
    promoCode: json["promo_code"],
    requestId: json["request_id"],
    userId: json["user_id"],
    status: json["status"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
    image1: json["image_1"],
    imageLogoSmall: json["image_logo_small"],
    storeCategoryId: json["store_category_id"],
    storeDeliveryType: json["store_delivery_type"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "instance_id": instanceId,
    "version_no": versionNo,
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
    "discount_price": discountPrice,
    "weight": weight,
    "promo_code": promoCode,
    "request_id": requestId,
    "user_id": userId,
    "status": status,
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
    "image_1": image1,
    "image_logo_small": imageLogoSmall,
    "store_category_id": storeCategoryId,
    "store_delivery_type": storeDeliveryType,
  };
}

class Checkout {
  Checkout({
    this.cartItemsData,
    this.cartTotals,
  });

  List<CartItemsDatum> cartItemsData;
  CartTotals cartTotals;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
    cartItemsData: List<CartItemsDatum>.from(json["cartItemsData"].map((x) => CartItemsDatum.fromJson(x))),
    cartTotals: CartTotals.fromJson(json["cartTotals"]),
  );

  Map<String, dynamic> toJson() => {
    "cartItemsData": List<dynamic>.from(cartItemsData.map((x) => x.toJson())),
    "cartTotals": cartTotals.toJson(),
  };
}

class CartItemsDatum {
  CartItemsDatum({
    this.appId,
    this.companyId,
    this.brandId,
    this.storeId,
    this.name,
    this.itemCount,
    this.cost,
    this.discount,
    this.priceAfterDiscount,
    this.storePromoCode,
    this.storePromoType,
    this.storePromoAmount,
    this.storePromoMinAmount,
    this.storePromoMaxAmount,
    this.storePriceAfterPromoCode,
    this.deliveryDate,
    this.deliverySlot,
    this.storeDeliveryType,
    this.weight,
    this.storeInstructions,
    this.imageUrl,
    this.logoUrl,
    this.toPay,
    this.items,
    this.priceAfterPromoCode,
  });

  int appId;
  int companyId;
  int brandId;
  int storeId;
  String name;
  int itemCount;
  double cost;
  double discount;
  int priceAfterDiscount;
  dynamic storePromoCode;
  dynamic storePromoType;
  int storePromoAmount;
  int storePromoMinAmount;
  int storePromoMaxAmount;
  int storePriceAfterPromoCode;
  dynamic deliveryDate;
  dynamic deliverySlot;
  int storeDeliveryType;
  double weight;
  dynamic storeInstructions;
  String imageUrl;
  String logoUrl;
  int toPay;
  List<CartItemsDatumItem> items;
  int priceAfterPromoCode;

  factory CartItemsDatum.fromJson(Map<String, dynamic> json) => CartItemsDatum(
    appId: json["app_id"],
    companyId: json["company_id"],
    brandId: json["brand_id"],
    storeId: json["store_id"],
    name: json["name"],
    itemCount: json["item_count"],
    cost: json["cost"].toDouble(),
    discount: json["discount"].toDouble(),
    priceAfterDiscount: json["price_after_discount"],
    storePromoCode: json["store_promo_code"],
    storePromoType: json["store_promo_type"],
    storePromoAmount: json["store_promo_amount"],
    storePromoMinAmount: json["store_promo_min_amount"],
    storePromoMaxAmount: json["store_promo_max_amount"],
    storePriceAfterPromoCode: json["store_price_after_promo_code"],
    deliveryDate: json["delivery_date"],
    deliverySlot: json["delivery_slot"],
    storeDeliveryType: json["store_delivery_type"],
    weight: json["weight"].toDouble(),
    storeInstructions: json["store_instructions"],
    imageUrl: json["image_url"],
    logoUrl: json["logo_url"],
    toPay: json["to_pay"],
    items: List<CartItemsDatumItem>.from(json["items"].map((x) => CartItemsDatumItem.fromJson(x))),
    priceAfterPromoCode: json["price_after_promo_code"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "company_id": companyId,
    "brand_id": brandId,
    "store_id": storeId,
    "name": name,
    "item_count": itemCount,
    "cost": cost,
    "discount": discount,
    "price_after_discount": priceAfterDiscount,
    "store_promo_code": storePromoCode,
    "store_promo_type": storePromoType,
    "store_promo_amount": storePromoAmount,
    "store_promo_min_amount": storePromoMinAmount,
    "store_promo_max_amount": storePromoMaxAmount,
    "store_price_after_promo_code": storePriceAfterPromoCode,
    "delivery_date": deliveryDate,
    "delivery_slot": deliverySlot,
    "store_delivery_type": storeDeliveryType,
    "weight": weight,
    "store_instructions": storeInstructions,
    "image_url": imageUrl,
    "logo_url": logoUrl,
    "to_pay": toPay,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "price_after_promo_code": priceAfterPromoCode,
  };
}

class CartItemsDatumItem {
  CartItemsDatumItem({
    this.appId,
    this.companyId,
    this.brandId,
    this.storeId,
    this.productName,
    this.productSku,
    this.productId,
    this.productUnitName,
    this.price,
    this.qty,
    this.orderQty,
    this.cost,
    this.discount,
    this.priceAfterDiscount,
    this.productPromoCode,
    this.productPromoType,
    this.productPromoAmount,
    this.productPromoMinAmount,
    this.productPromoMaxAmount,
    this.productPriceAfterPromoCode,
    this.toPay,
    this.weight,
    this.productDescription,
    this.imageUrl,
    this.productInstructions,
    this.priceAfterPromoCode,
  });

  int appId;
  int companyId;
  int brandId;
  int storeId;
  String productName;
  String productSku;
  String productId;
  String productUnitName;
  double price;
  int qty;
  int orderQty;
  double cost;
  double discount;
  int priceAfterDiscount;
  dynamic productPromoCode;
  dynamic productPromoType;
  int productPromoAmount;
  int productPromoMinAmount;
  int productPromoMaxAmount;
  int productPriceAfterPromoCode;
  int toPay;
  double weight;
  String productDescription;
  String imageUrl;
  dynamic productInstructions;
  int priceAfterPromoCode;

  factory CartItemsDatumItem.fromJson(Map<String, dynamic> json) => CartItemsDatumItem(
    appId: json["app_id"],
    companyId: json["company_id"],
    brandId: json["brand_id"],
    storeId: json["store_id"],
    productName: json["product_name"],
    productSku: json["product_sku"],
    productId: json["product_id"],
    productUnitName: json["product_unit_name"],
    price: json["price"].toDouble(),
    qty: json["qty"],
    orderQty: json["order_qty"],
    cost: json["cost"].toDouble(),
    discount: json["discount"].toDouble(),
    priceAfterDiscount: json["price_after_discount"],
    productPromoCode: json["product_promo_code"],
    productPromoType: json["product_promo_type"],
    productPromoAmount: json["product_promo_amount"],
    productPromoMinAmount: json["product_promo_min_amount"],
    productPromoMaxAmount: json["product_promo_max_amount"],
    productPriceAfterPromoCode: json["product_price_after_promo_code"],
    toPay: json["to_pay"],
    weight: json["weight"].toDouble(),
    productDescription: json["product_description"],
    imageUrl: json["image_url"],
    productInstructions: json["product_instructions"],
    priceAfterPromoCode: json["price_after_promo_code"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "company_id": companyId,
    "brand_id": brandId,
    "store_id": storeId,
    "product_name": productName,
    "product_sku": productSku,
    "product_id": productId,
    "product_unit_name": productUnitName,
    "price": price,
    "qty": qty,
    "order_qty": orderQty,
    "cost": cost,
    "discount": discount,
    "price_after_discount": priceAfterDiscount,
    "product_promo_code": productPromoCode,
    "product_promo_type": productPromoType,
    "product_promo_amount": productPromoAmount,
    "product_promo_min_amount": productPromoMinAmount,
    "product_promo_max_amount": productPromoMaxAmount,
    "product_price_after_promo_code": productPriceAfterPromoCode,
    "to_pay": toPay,
    "weight": weight,
    "product_description": productDescription,
    "image_url": imageUrl,
    "product_instructions": productInstructions,
    "price_after_promo_code": priceAfterPromoCode,
  };
}

class CartTotals {
  CartTotals({
    this.stores,
    this.items,
    this.promoCode,
    this.promoType,
    this.promoMinAmount,
    this.promoMaxAmount,
    this.promoAmount,
    this.weight,
    this.cost,
    this.discount,
    this.priceAfterDiscount,
    this.priceAfterPromoCode,
    this.toPay,
    this.stripeReserveAmount,
    this.numSelfDeliveryStores,
    this.numDeliveryStores,
    this.deliveryFee,
    this.serviceFee,
    this.surcharges,
    this.stripeHoldAmount,
    this.totals,
    this.cartInstructions,
  });

  int stores;
  int items;
  String promoCode;
  dynamic promoType;
  int promoMinAmount;
  int promoMaxAmount;
  int promoAmount;
  double weight;
  double cost;
  double discount;
  int priceAfterDiscount;
  int priceAfterPromoCode;
  int toPay;
  int stripeReserveAmount;
  int numSelfDeliveryStores;
  int numDeliveryStores;
  double deliveryFee;
  int serviceFee;
  Surcharges surcharges;
  double stripeHoldAmount;
  int totals;
  String cartInstructions;

  factory CartTotals.fromJson(Map<String, dynamic> json) => CartTotals(
    stores: json["stores"],
    items: json["items"],
    promoCode: json["promo_code"],
    promoType: json["promo_type"],
    promoMinAmount: json["promo_min_amount"],
    promoMaxAmount: json["promo_max_amount"],
    promoAmount: json["promo_amount"],
    weight: json["weight"].toDouble(),
    cost: json["cost"].toDouble(),
    discount: json["discount"].toDouble(),
    priceAfterDiscount: json["price_after_discount"],
    priceAfterPromoCode: json["price_after_promo_code"],
    toPay: json["to_pay"],
    stripeReserveAmount: json["stripe_reserve_amount"],
    numSelfDeliveryStores: json["num_self_delivery_stores"],
    numDeliveryStores: json["num_delivery_stores"],
    deliveryFee: json["delivery_fee"].toDouble(),
    serviceFee: json["service_fee"],
    surcharges: Surcharges.fromJson(json["surcharges"]),
    stripeHoldAmount: json["stripe_hold_amount"].toDouble(),
    totals: json["totals"],
    cartInstructions: json["cart_instructions"],
  );

  Map<String, dynamic> toJson() => {
    "stores": stores,
    "items": items,
    "promo_code": promoCode,
    "promo_type": promoType,
    "promo_min_amount": promoMinAmount,
    "promo_max_amount": promoMaxAmount,
    "promo_amount": promoAmount,
    "weight": weight,
    "cost": cost,
    "discount": discount,
    "price_after_discount": priceAfterDiscount,
    "price_after_promo_code": priceAfterPromoCode,
    "to_pay": toPay,
    "stripe_reserve_amount": stripeReserveAmount,
    "num_self_delivery_stores": numSelfDeliveryStores,
    "num_delivery_stores": numDeliveryStores,
    "delivery_fee": deliveryFee,
    "service_fee": serviceFee,
    "surcharges": surcharges.toJson(),
    "stripe_hold_amount": stripeHoldAmount,
    "totals": totals,
    "cart_instructions": cartInstructions,
  };
}

class Surcharges {
  Surcharges({
    this.totalSurcharge,
    this.smallBasketSurcharge,
    this.peakHoursSurcharge,
    this.offHoursSurcharge,
    this.heavyWeightSurcharge,
    this.bulkVolumeSurcharge,
    this.productHandlingSurcharge,
    this.packagingSurcharge,
    this.additionalDistanceSurcharge,
  });

  int totalSurcharge;
  int smallBasketSurcharge;
  int peakHoursSurcharge;
  int offHoursSurcharge;
  int heavyWeightSurcharge;
  int bulkVolumeSurcharge;
  int productHandlingSurcharge;
  int packagingSurcharge;
  int additionalDistanceSurcharge;

  factory Surcharges.fromJson(Map<String, dynamic> json) => Surcharges(
    totalSurcharge: json["total_surcharge"],
    smallBasketSurcharge: json["small_basket_surcharge"],
    peakHoursSurcharge: json["peak_hours_surcharge"],
    offHoursSurcharge: json["off_hours_surcharge"],
    heavyWeightSurcharge: json["heavy_weight_surcharge"],
    bulkVolumeSurcharge: json["bulk_volume_surcharge"],
    productHandlingSurcharge: json["product_handling_surcharge"],
    packagingSurcharge: json["packaging_surcharge"],
    additionalDistanceSurcharge: json["additional_distance_surcharge"],
  );

  Map<String, dynamic> toJson() => {
    "total_surcharge": totalSurcharge,
    "small_basket_surcharge": smallBasketSurcharge,
    "peak_hours_surcharge": peakHoursSurcharge,
    "off_hours_surcharge": offHoursSurcharge,
    "heavy_weight_surcharge": heavyWeightSurcharge,
    "bulk_volume_surcharge": bulkVolumeSurcharge,
    "product_handling_surcharge": productHandlingSurcharge,
    "packaging_surcharge": packagingSurcharge,
    "additional_distance_surcharge": additionalDistanceSurcharge,
  };
}
