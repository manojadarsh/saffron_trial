// To parse this JSON data, do
//
//     final pastOrders = pastOrdersFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

PastOrders pastOrdersFromJson(String str) => PastOrders.fromJson(json.decode(str));

String pastOrdersToJson(PastOrders data) => json.encode(data.toJson());

class PastOrders {
  PastOrders({
    this.message,
    this.filtered,
    this.data,
  });

  String message;
  List<dynamic> filtered;
  Data data;

  factory PastOrders.fromJson(Map<String, dynamic> json) => PastOrders(
    message: json["message"],
    filtered: List<dynamic>.from(json["filtered"].map((x) => x)),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "filtered": List<dynamic>.from(filtered.map((x) => x)),
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.storeOrders,
    this.received,
  });

  StoreOrders storeOrders;
  Received received;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    storeOrders: StoreOrders.fromJson(json["storeOrders"]),
    received: Received.fromJson(json["received"]),
  );

  Map<String, dynamic> toJson() => {
    "storeOrders": storeOrders.toJson(),
    "received": received.toJson(),
  };
}

class Received {
  Received({
    this.appId,
    this.userId,
    this.customerId,
    this.requestType,
    this.options,
  });

  int appId;
  int userId;
  int customerId;
  String requestType;
  Options options;

  factory Received.fromJson(Map<String, dynamic> json) => Received(
    appId: json["app_id"],
    userId: json["user_id"],
    customerId: json["customer_id"],
    requestType: json["request_type"],
    options: Options.fromJson(json["options"]),
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "user_id": userId,
    "customer_id": customerId,
    "request_type": requestType,
    "options": options.toJson(),
  };
}

class Options {
  Options({
    this.dateFrom,
    this.dateTo,
    this.orderTypes,
    this.orderStatus,
  });

  String dateFrom;
  DateTime dateTo;
  OrderTypes orderTypes;
  OrderStatus orderStatus;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    dateFrom: json["date_from"],
    dateTo: DateTime.parse(json["date_to"]),
    orderTypes: OrderTypes.fromJson(json["order_types"]),
    orderStatus: OrderStatus.fromJson(json["order_status"]),
  );

  Map<String, dynamic> toJson() => {
    "date_from": dateFrom,
    "date_to": "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
    "order_types": orderTypes.toJson(),
    "order_status": orderStatus.toJson(),
  };
}

class OrderStatus {
  OrderStatus({
    this.cancelOrder,
    this.deliveredOrder,
    this.newOrder,
    this.refundedOrder,
    this.disputedOrder,
  });

  bool cancelOrder;
  bool deliveredOrder;
  bool newOrder;
  bool refundedOrder;
  bool disputedOrder;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    cancelOrder: json["cancel_order"],
    deliveredOrder: json["delivered_order"],
    newOrder: json["new_order"],
    refundedOrder: json["refunded_order"],
    disputedOrder: json["disputed_order"],
  );

  Map<String, dynamic> toJson() => {
    "cancel_order": cancelOrder,
    "delivered_order": deliveredOrder,
    "new_order": newOrder,
    "refunded_order": refundedOrder,
    "disputed_order": disputedOrder,
  };
}

class OrderTypes {
  OrderTypes({
    this.delivery,
    this.storeDelivery,
    this.storePickup,
  });

  bool delivery;
  bool storeDelivery;
  bool storePickup;

  factory OrderTypes.fromJson(Map<String, dynamic> json) => OrderTypes(
    delivery: json["delivery"],
    storeDelivery: json["store_delivery"],
    storePickup: json["store_pickup"],
  );

  Map<String, dynamic> toJson() => {
    "delivery": delivery,
    "store_delivery": storeDelivery,
    "store_pickup": storePickup,
  };
}

class StoreOrders {
  StoreOrders({
    this.elapsed,
    this.request,
    this.response,
  });

  String elapsed;
  Received request;
  Response response;

  factory StoreOrders.fromJson(Map<String, dynamic> json) => StoreOrders(
    elapsed: json["elapsed"],
    request: Received.fromJson(json["request"]),
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "elapsed": elapsed,
    "request": request.toJson(),
    "response": response.toJson(),
  };
}

class Response {
  Response({
    this.summary,
    this.orders,
  });

  Summary summary;
  List<Order> orders;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    summary: Summary.fromJson(json["summary"]),
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary.toJson(),
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    this.customerReference,
    this.storeReference,
    this.storeId,
    this.orderId,
    this.orderType,
    this.orderStatus,
    this.orderPickupDate,
    this.customerId,
    this.orderDetails,
  });

  String customerReference;
  String storeReference;
  int storeId;
  int orderId;
  int orderType;
  int orderStatus;
  DateTime orderPickupDate;
  int customerId;
  OrderDetails orderDetails;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    customerReference: json["customer_reference"],
    storeReference: json["store_reference"],
    storeId: json["store_id"],
    orderId: json["order_id"],
    orderType: json["order_type"],
    orderStatus: json["order_status"],
    orderPickupDate: json["order_pickup_date"] == null ? null : DateTime.parse(json["order_pickup_date"]),
    customerId: json["customer_id"],
    orderDetails: OrderDetails.fromJson(json["orderDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_reference": customerReference,
    "store_reference": storeReference,
    "store_id": storeId,
    "order_id": orderId,
    "order_type": orderType,
    "order_status": orderStatus,
    "order_pickup_date": orderPickupDate == null ? null : orderPickupDate.toIso8601String(),
    "customer_id": customerId,
    "orderDetails": orderDetails.toJson(),
  };
}

class OrderDetails {
  OrderDetails({
    this.summary,
    this.items,
  });

  Summary summary;
  List<Item> items;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    summary: Summary.fromJson(json["summary"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item with ChangeNotifier {
  Item({
    this.productSku,
    this.productName,
    this.bookedQuantity,
    this.storePrice,
    this.storeDiscountPrice,
    this.orderedPrice,
    this.orderedDiscountPrice,
    this.cost,
    this.discountedCost,
  });

  String productSku;
  String productName;
  int bookedQuantity;
  double storePrice;
  double storeDiscountPrice;
  int orderedPrice;
  int orderedDiscountPrice;
  double cost;
  double discountedCost;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    productSku: json["product_sku"],
    productName: json["product_name"],
    bookedQuantity: json["booked_quantity"],
    storePrice: json["store_price"].toDouble(),
    storeDiscountPrice: json["store_discount_price"].toDouble(),
    orderedPrice: json["ordered_price"],
    orderedDiscountPrice: json["ordered_discount_price"],
    cost: json["cost"].toDouble(),
    discountedCost: json["discounted_cost"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_sku": productSku,
    "product_name": productName,
    "booked_quantity": bookedQuantity,
    "store_price": storePrice,
    "store_discount_price": storeDiscountPrice,
    "ordered_price": orderedPrice,
    "ordered_discount_price": orderedDiscountPrice,
    "cost": cost,
    "discounted_cost": discountedCost,
  };
}

class Summary {
  Summary({
    this.cost,
    this.discountedCost,
    this.count,
    this.numOrders,
  });

  double cost;
  double discountedCost;
  int count;
  int numOrders;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    cost: json["cost"].toDouble(),
    discountedCost: json["discounted_cost"].toDouble(),
    count: json["count"],
    numOrders: json["numOrders"] == null ? null : json["numOrders"],
  );

  Map<String, dynamic> toJson() => {
    "cost": cost,
    "discounted_cost": discountedCost,
    "count": count,
    "numOrders": numOrders == null ? null : numOrders,
  };
}
