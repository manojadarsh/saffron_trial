// To parse this JSON data, do
//
//     final favoriteStore = favoriteStoreFromJson(jsonString);

import 'dart:convert';

FavoriteStore favoriteStoreFromJson(String str) => FavoriteStore.fromJson(json.decode(str));

String favoriteStoreToJson(FavoriteStore data) => json.encode(data.toJson());

class FavoriteStore {
  FavoriteStore({
    this.response,
  });

  Response response;

  factory FavoriteStore.fromJson(Map<String, dynamic> json) => FavoriteStore(
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
  };
}

class Response {
  Response({
    this.processTime,
    this.received,
    this.rows,
  });

  ProcessTime processTime;
  Received received;
  List<Row> rows;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    processTime: ProcessTime.fromJson(json["process_time"]),
    received: Received.fromJson(json["received"]),
    rows: List<Row>.from(json["rows"].map((x) => Row.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "process_time": processTime.toJson(),
    "received": received.toJson(),
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class ProcessTime {
  ProcessTime({
    this.secs,
    this.millisecs,
  });

  int secs;
  double millisecs;

  factory ProcessTime.fromJson(Map<String, dynamic> json) => ProcessTime(
    secs: json["secs"],
    millisecs: json["millisecs"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "secs": secs,
    "millisecs": millisecs,
  };
}

class Received {
  Received({
    this.appId,
    this.userId,
  });

  String appId;
  String userId;

  factory Received.fromJson(Map<String, dynamic> json) => Received(
    appId: json["app_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "user_id": userId,
  };
}

class Row {
  Row({
    this.tag,
    this.storeFavorites,
  });

  String tag;
  StoreFavorites storeFavorites;

  factory Row.fromJson(Map<String, dynamic> json) => Row(
    tag: json["tag"],
    storeFavorites: StoreFavorites.fromJson(json["store_favorites"]),
  );

  Map<String, dynamic> toJson() => {
    "tag": tag,
    "store_favorites": storeFavorites.toJson(),
  };
}

class StoreFavorites {
  StoreFavorites({
    this.status,
    this.count,
    this.message,
    this.data,
  });

  int status;
  int count;
  String message;
  List<Datum> data;

  factory StoreFavorites.fromJson(Map<String, dynamic> json) => StoreFavorites(
    status: json["status"],
    count: json["count"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "count": count,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.storeName,
    this.imageUrl,
    this.storeCategoryName,
    this.categoryImageUrl,
    this.id,
    this.appId,
    this.userId,
    this.instanceId,
    this.companyId,
    this.brandId,
    this.storeId,
    this.requestId,
    this.favouriteIndicator,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
  });

  String storeName;
  String imageUrl;
  String storeCategoryName;
  String categoryImageUrl;
  int id;
  int appId;
  int userId;
  int instanceId;
  int companyId;
  int brandId;
  int storeId;
  String requestId;
  int favouriteIndicator;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    storeName: json["store_name"],
    imageUrl: json["image_url"],
    storeCategoryName: json["store_category_name"],
    categoryImageUrl: json["category_image_url"],
    id: json["id"],
    appId: json["app_id"],
    userId: json["user_id"],
    instanceId: json["instance_id"],
    companyId: json["company_id"],
    brandId: json["brand_id"],
    storeId: json["store_id"],
    requestId: json["request_id"],
    favouriteIndicator: json["favourite_indicator"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "store_name": storeName,
    "image_url": imageUrl,
    "store_category_name": storeCategoryName,
    "category_image_url": categoryImageUrl,
    "id": id,
    "app_id": appId,
    "user_id": userId,
    "instance_id": instanceId,
    "company_id": companyId,
    "brand_id": brandId,
    "store_id": storeId,
    "request_id": requestId,
    "favourite_indicator": favouriteIndicator,
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
  };
}
