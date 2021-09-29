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

class UserAddressEntity extends Persistent{
  UserAddressEntity({
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
  final BjUser bjUser;

  factory UserAddressEntity.fromJson(Map<String, dynamic> json) => UserAddressEntity(
    id: json["id"] == null ? null : json["id"],
    country: json["country"] == null ? null : json["country"],
    state: json["state"] == null ? null : json["state"],
    city: json["city"] == null ? null : json["city"],
    address: json["address"] == null ? null : json["address"],
    zip: json["zip"] == null ? null : json["zip"],
    latitute: json["latitute"] == null ? null : json["latitute"].toDouble(),
    longitute: json["longitute"] == null ? null : json["longitute"].toDouble(),
    bjUser: json["bjUser"] == null ? null : BjUser.fromJson(json["bjUser"]),
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
    "bjUser": bjUser == null ? null : bjUser.toJson(),
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
  });

  final int id;
  final String email;
  final String username;
  final List<String> roles;
  final String password;
  final dynamic salt;
  final List<dynamic> bjUserAddresses;
  final List<dynamic> supports;
  final String currency;
  final String language;

  factory BjUser.fromJson(Map<String, dynamic> json) => BjUser(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    username: json["username"] == null ? null : json["username"],
    roles: json["roles"] == null ? null : List<String>.from(json["roles"].map((x) => x)),
    password: json["password"] == null ? null : json["password"],
    salt: json["salt"],
    bjUserAddresses: json["bjUserAddresses"] == null ? null : List<dynamic>.from(json["bjUserAddresses"].map((x) => x)),
    supports: json["supports"] == null ? null : List<dynamic>.from(json["supports"].map((x) => x)),
    currency: json["currency"] == null ? null : json["currency"],
    language: json["language"] == null ? null : json["language"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "username": username == null ? null : username,
    "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x)),
    "password": password == null ? null : password,
    "salt": salt,
    "bjUserAddresses": bjUserAddresses == null ? null : List<dynamic>.from(bjUserAddresses.map((x) => x)),
    "supports": supports == null ? null : List<dynamic>.from(supports.map((x) => x)),
    "currency": currency == null ? null : currency,
    "language": language == null ? null : language,
  };
}
