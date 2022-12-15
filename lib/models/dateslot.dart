// To parse this JSON data, do
//
//     final dateSlots = dateSlotsFromJson(jsonString);

import 'dart:convert';

DateSlots dateSlotsFromJson(String str) => DateSlots.fromJson(json.decode(str));

String dateSlotsToJson(DateSlots data) => json.encode(data.toJson());

class DateSlots {
  DateSlots({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory DateSlots.fromJson(Map<String, dynamic> json) => DateSlots(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.response,
    this.received,
  });

  List<Slot> response;
  Received received;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    response: List<Slot>.from(json["response"].map((x) => Slot.fromJson(x))),
    received: Received.fromJson(json["received"]),
  );

  Map<String, dynamic> toJson() => {
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "received": received.toJson(),
  };
}

class Received {
  Received({
    this.appId,
    this.uniqueRequestId,
    this.deliveryType,
  });

  String appId;
  String uniqueRequestId;
  String deliveryType;

  factory Received.fromJson(Map<String, dynamic> json) => Received(
    appId: json["appId"],
    uniqueRequestId: json["uniqueRequestId"],
    deliveryType: json["deliveryType"],
  );

  Map<String, dynamic> toJson() => {
    "appId": appId,
    "uniqueRequestId": uniqueRequestId,
    "deliveryType": deliveryType,
  };
}

class Slot {
  Slot({
    this.date,
    this.day,
    this.shortMonth,
    this.year,
    this.month,
    this.totalSlots,
    this.committedSlots,
    this.availableSlots,
  });

  String date;
  String day;
  String shortMonth;
  String year;
  String month;
  int totalSlots;
  int committedSlots;
  int availableSlots;

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
    date: json["date"],
    day: json["day"],
    shortMonth: json["shortMonth"],
    year: json["year"],
    month: json["month"],
    totalSlots: json["totalSlots"],
    committedSlots: json["committedSlots"],
    availableSlots: json["availableSlots"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "day": day,
    "shortMonth": shortMonth,
    "year": year,
    "month": month,
    "totalSlots": totalSlots,
    "committedSlots": committedSlots,
    "availableSlots": availableSlots,
  };
}
