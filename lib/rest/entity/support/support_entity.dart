/*
 *  DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 *  Copyright (C) 2021 Rich Design - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential.
 *
 *  Written by Yakup Zengin <yakup@designsrich.com>, March 2021
 *
 */


import '../../persistent.dart';

class SupportEntity extends Persistent{
  SupportEntity({
    this.id,
    this.name,
    this.supports,
    this.initializer,
    this.cloner,
    this.isInitialized,
  });

  final int id;
  final String name;
  final List<Welcome> supports;
  final dynamic initializer;
  final dynamic cloner;
  final bool isInitialized;

  factory SupportEntity.fromJson(Map<String, dynamic> json) => SupportEntity(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    supports: json["supports"] == null ? null : List<Welcome>.from(json["supports"].map((x) => x == null ? null : Welcome.fromJson(x))),
    initializer: json["__initializer__"],
    cloner: json["__cloner__"],
    isInitialized: json["__isInitialized__"] == null ? null : json["__isInitialized__"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "supports": supports == null ? null : List<dynamic>.from(supports.map((x) => x == null ? null : x.toJson())),
    "__initializer__": initializer,
    "__cloner__": cloner,
    "__isInitialized__": isInitialized == null ? null : isInitialized,
  };
}

class Welcome {
  Welcome({
    this.id,
    this.message,
    this.image,
    this.isActive,
    this.bjUser,
    this.supportReason,
  });

  final int id;
  final String message;
  final String image;
  final bool isActive;
  final BjUser bjUser;
  final SupportEntity supportReason;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"] == null ? null : json["id"],
    message: json["message"] == null ? null : json["message"],
    image: json["image"] == null ? null : json["image"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    bjUser: json["bjUser"] == null ? null : BjUser.fromJson(json["bjUser"]),
    supportReason: json["supportReason"] == null ? null : SupportEntity.fromJson(json["supportReason"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "message": message == null ? null : message,
    "image": image == null ? null : image,
    "isActive": isActive == null ? null : isActive,
    "bjUser": bjUser == null ? null : bjUser.toJson(),
    "supportReason": supportReason == null ? null : supportReason.toJson(),
  };
}

class BjUser {
  BjUser({
    this.id,
    this.email,
    this.username,
    this.roles,
    this.password,
    this.salt,
    this.bjUserAddresses,
    this.supports,
    this.currency,
    this.language,
    this.initializer,
    this.cloner,
    this.isInitialized,
  });

  final int id;
  final String email;
  final String username;
  final List<String> roles;
  final String password;
  final dynamic salt;
  final List<BjUserAddress> bjUserAddresses;
  final List<dynamic> supports;
  final String currency;
  final String language;
  final dynamic initializer;
  final dynamic cloner;
  final bool isInitialized;

  factory BjUser.fromJson(Map<String, dynamic> json) => BjUser(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    username: json["username"] == null ? null : json["username"],
    roles: json["roles"] == null ? null : List<String>.from(json["roles"].map((x) => x)),
    password: json["password"] == null ? null : json["password"],
    salt: json["salt"],
    bjUserAddresses: json["bjUserAddresses"] == null ? null : List<BjUserAddress>.from(json["bjUserAddresses"].map((x) => BjUserAddress.fromJson(x))),
    supports: json["supports"] == null ? null : List<dynamic>.from(json["supports"].map((x) => x)),
    currency: json["currency"] == null ? null : json["currency"],
    language: json["language"] == null ? null : json["language"],
    initializer: json["__initializer__"],
    cloner: json["__cloner__"],
    isInitialized: json["__isInitialized__"] == null ? null : json["__isInitialized__"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "username": username == null ? null : username,
    "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x)),
    "password": password == null ? null : password,
    "salt": salt,
    "bjUserAddresses": bjUserAddresses == null ? null : List<dynamic>.from(bjUserAddresses.map((x) => x.toJson())),
    "supports": supports == null ? null : List<dynamic>.from(supports.map((x) => x)),
    "currency": currency == null ? null : currency,
    "language": language == null ? null : language,
    "__initializer__": initializer,
    "__cloner__": cloner,
    "__isInitialized__": isInitialized == null ? null : isInitialized,
  };
}

class BjUserAddress {
  BjUserAddress({
    this.id,
    this.country,
    this.state,
    this.city,
    this.address,
    this.zip,
    this.latitute,
    this.longitute,
    this.bjUser,
  });

  final int id;
  final String country;
  final String state;
  final String city;
  final String address;
  final String zip;
  final double latitute;
  final double longitute;
  final dynamic bjUser;

  factory BjUserAddress.fromJson(Map<String, dynamic> json) => BjUserAddress(
    id: json["id"] == null ? null : json["id"],
    country: json["country"] == null ? null : json["country"],
    state: json["state"] == null ? null : json["state"],
    city: json["city"] == null ? null : json["city"],
    address: json["address"] == null ? null : json["address"],
    zip: json["zip"] == null ? null : json["zip"],
    latitute: json["latitute"] == null ? null : json["latitute"].toDouble(),
    longitute: json["longitute"] == null ? null : json["longitute"].toDouble(),
    bjUser: json["bjUser"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "country": country == null ? null : country,
    "state": state == null ? null : state,
    "city": city == null ? null : city,
    "address": address == null ? null : address,
    "zip": zip == null ? null : zip,
    "latitute": latitute == null ? null : latitute,
    "longitute": longitute == null ? null : longitute,
    "bjUser": bjUser,
  };
}
