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

class SetAddressEntity extends Persistent{
  SetAddressEntity({
    this.country,
    this.city,
    this.state,
    this.zip,
    this.latitute,
    this.longitute,
    this.address,
  });

  final String country;
  final String city;
  final String state;
  final String zip;
  final double latitute;
  final double longitute;
  final String address;

  factory SetAddressEntity.fromJson(Map<String, dynamic> json) => SetAddressEntity(
    country: json["country"] == null ? null : json["country"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    zip: json["zip"] == null ? null : json["zip"],
    latitute: json["latitute"] == null ? null : json["latitute"].toDouble(),
    longitute: json["longitute"] == null ? null : json["longitute"].toDouble(),
    address: json["address"] == null ? null : json["address"],
  );

  Map<String, dynamic> toJson() => {
    "country": country == null ? null : country,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "zip": zip == null ? null : zip,
    "latitute": latitute == null ? null : latitute,
    "longitute": longitute == null ? null : longitute,
    "address": address == null ? null : address,
  };
}
