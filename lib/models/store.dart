// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Store> storeFromJson(String str) => List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store with ChangeNotifier{
  Store({
    this.appId,
    this.appName,
    this.whiteLabel,
    this.appLogo1,
    this.appLogo2,
    this.appOwnerId,
    this.appOwnerName,
    this.appDescription,
    this.instanceId,
    this.instanceName,
    this.instanceSubZone,
    this.instanceSubZoneName,
    this.companyId,
    this.brandId,
    this.storeId,
    this.storeTag1,
    this.storeTag2,
    this.storeTag3,
    this.storeName,
    this.storeActive,
    this.rating,
    this.storeResumeHours,
    this.storeLastActiveHours,
    this.dateCreated,
    this.dateActivated,
    this.dateSuspended,
    this.dateUpdated,
    this.city,
    this.storeDeliveryType,
    this.lat,
    this.lng,
    this.id,
    this.label,
    this.locationName,
    this.country,
    this.formattedAddress,
    this.draggable,
    this.branchName,
    this.imageUrl,
    this.imageLogoSmall,
    this.imageLogoBig,
    this.imagePromo1,
    this.imagePromo2,
    this.imagePromo3,
    this.image1,
    this.image2,
    this.image3,
    this.storeFilterCriteria1,
    this.storeFilterCriteria2,
    this.storeFilterCriteria3,
    this.reviewCount,
    this.storeCategoryId,
    this.storeCategoryName,
    this.storeMgrId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.statusIndicator,
    this.mobile1,
    this.mobile2,
    this.email1,
    this.email2,
    this.brandName,
    this.companyName,
  });

  int appId;
  String appName;
  int whiteLabel;
  String appLogo1;
  String appLogo2;
  int appOwnerId;
  String appOwnerName;
  String appDescription;
  int instanceId;
  String instanceName;
  String instanceSubZone;
  String instanceSubZoneName;
  int companyId;
  int brandId;
  int storeId;
  String storeTag1;
  String storeTag2;
  String storeTag3;
  String storeName;
  int storeActive;
  int rating;
  DateTime storeResumeHours;
  DateTime storeLastActiveHours;
  DateTime dateCreated;
  DateTime dateActivated;
  dynamic dateSuspended;
  DateTime dateUpdated;
  String city;
  int storeDeliveryType;
  double lat;
  double lng;
  int id;
  dynamic label;
  String locationName;
  String country;
  String formattedAddress;
  int draggable;
  String branchName;
  String imageUrl;
  String imageLogoSmall;
  String imageLogoBig;
  String imagePromo1;
  String imagePromo2;
  String imagePromo3;
  String image1;
  String image2;
  String image3;
  int storeFilterCriteria1;
  int storeFilterCriteria2;
  int storeFilterCriteria3;
  int reviewCount;
  int storeCategoryId;
  String storeCategoryName;
  int storeMgrId;
  String firstName;
  String middleName;
  String lastName;
  int statusIndicator;
  String mobile1;
  String mobile2;
  String email1;
  String email2;
  String brandName;
  String companyName;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    appId: json["app_id"],
    appName: json["app_name"],
    whiteLabel: json["white_label"],
    appLogo1: json["app_logo_1"],
    appLogo2: json["app_logo_2"],
    appOwnerId: json["app_owner_id"],
    appOwnerName: json["app_owner_name"],
    appDescription: json["app_description"],
    instanceId: json["instance_id"],
    instanceName: json["instance_name"],
    instanceSubZone: json["instance_sub_zone"],
    instanceSubZoneName: json["instance_sub_zone_name"],
    companyId: json["company_id"],
    brandId: json["brand_id"],
    storeId: json["store_id"],
    storeTag1: json["store_tag_1"],
    storeTag2: json["store_tag_2"],
    storeTag3: json["store_tag_3"],
    storeName: json["store_name"],
    storeActive: json["store_active"],
    rating: json["rating"],
    storeResumeHours: DateTime.parse(json["store_resume_hours"]),
    storeLastActiveHours: DateTime.parse(json["store_last_active_hours"]),
    dateCreated: DateTime.parse(json["date_created"]),
    dateActivated: DateTime.parse(json["date_activated"]),
    dateSuspended: json["date_suspended"],
    dateUpdated: DateTime.parse(json["date_updated"]),
    city: json["city"],
    storeDeliveryType: json["store_delivery_type"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
    id: json["id"],
    label: json["label"],
    locationName: json["location_name"],
    country: json["country"],
    formattedAddress: json["formatted_address"] == null ? null : json["formatted_address"],
    draggable: json["draggable"],
    branchName: json["branch_name"],
    imageUrl: json["image_url"],
    imageLogoSmall: json["image_logo_small"],
    imageLogoBig: json["image_logo_big"] == null ? null : json["image_logo_big"],
    imagePromo1: json["image_promo_1"] == null ? null : json["image_promo_1"],
    imagePromo2: json["image_promo_2"] == null ? null : json["image_promo_2"],
    imagePromo3: json["image_promo_3"] == null ? null : json["image_promo_3"],
    image1: json["image_1"],
    image2: json["image_2"],
    image3: json["image_3"],
    storeFilterCriteria1: json["store_filter_criteria_1"],
    storeFilterCriteria2: json["store_filter_criteria_2"],
    storeFilterCriteria3: json["store_filter_criteria_3"],
    reviewCount: json["review_count"],
    storeCategoryId: json["store_category_id"],
    storeCategoryName: json["store_category_name"],
    storeMgrId: json["store_mgr_id"] == null ? null : json["store_mgr_id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    middleName: json["middle_name"] == null ? null : json["middle_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    statusIndicator: json["status_indicator"] == null ? null : json["status_indicator"],
    mobile1: json["mobile_1"] == null ? null : json["mobile_1"],
    mobile2: json["mobile_2"] == null ? null : json["mobile_2"],
    email1: json["email_1"] == null ? null : json["email_1"],
    email2: json["email_2"] == null ? null : json["email_2"],
    brandName: json["brand_name"],
    companyName: json["company_name"],
  );

  Map<String, dynamic> toJson() => {
    "app_id": appId,
    "app_name": appName,
    "white_label": whiteLabel,
    "app_logo_1": appLogo1,
    "app_logo_2": appLogo2,
    "app_owner_id": appOwnerId,
    "app_owner_name": appOwnerName,
    "app_description": appDescription,
    "instance_id": instanceId,
    "instance_name": instanceName,
    "instance_sub_zone": instanceSubZone,
    "instance_sub_zone_name": instanceSubZoneName,
    "company_id": companyId,
    "brand_id": brandId,
    "store_id": storeId,
    "store_tag_1": storeTag1,
    "store_tag_2": storeTag2,
    "store_tag_3": storeTag3,
    "store_name": storeName,
    "store_active": storeActive,
    "rating": rating,
    "store_resume_hours": storeResumeHours.toIso8601String(),
    "store_last_active_hours": storeLastActiveHours.toIso8601String(),
    "date_created": dateCreated.toIso8601String(),
    "date_activated": dateActivated.toIso8601String(),
    "date_suspended": dateSuspended,
    "date_updated": dateUpdated.toIso8601String(),
    "city": city,
    "store_delivery_type": storeDeliveryType,
    "lat": lat,
    "lng": lng,
    "id": id,
    "label": label,
    "location_name": locationName,
    "country": country,
    "formatted_address": formattedAddress == null ? null : formattedAddress,
    "draggable": draggable,
    "branch_name": branchName,
    "image_url": imageUrl,
    "image_logo_small": imageLogoSmall,
    "image_logo_big": imageLogoBig == null ? null : imageLogoBig,
    "image_promo_1": imagePromo1 == null ? null : imagePromo1,
    "image_promo_2": imagePromo2 == null ? null : imagePromo2,
    "image_promo_3": imagePromo3 == null ? null : imagePromo3,
    "image_1": image1,
    "image_2": image2,
    "image_3": image3,
    "store_filter_criteria_1": storeFilterCriteria1,
    "store_filter_criteria_2": storeFilterCriteria2,
    "store_filter_criteria_3": storeFilterCriteria3,
    "review_count": reviewCount,
    "store_category_id": storeCategoryId,
    "store_category_name": storeCategoryName,
    "store_mgr_id": storeMgrId == null ? null : storeMgrId,
    "first_name": firstName == null ? null : firstName,
    "middle_name": middleName == null ? null : middleName,
    "last_name": lastName == null ? null : lastName,
    "status_indicator": statusIndicator == null ? null : statusIndicator,
    "mobile_1": mobile1 == null ? null : mobile1,
    "mobile_2": mobile2 == null ? null : mobile2,
    "email_1": email1 == null ? null : email1,
    "email_2": email2 == null ? null : email2,
    "brand_name": brandName,
    "company_name": companyName,
  };
}
