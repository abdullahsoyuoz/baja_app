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


class EcwidCustomerEntity extends Persistent{
  EcwidCustomerEntity({
    this.id,
    this.name,
    this.email,
    this.registered,
    this.updated,
    this.totalOrderCount,
    this.customerGroupId,
    this.customerGroupName,
    this.billingPerson,
    this.shippingAddresses,
    this.taxExempt,
    this.taxIdValid,
    this.acceptMarketing,
  });

  final int id;
  final String name;
  final String email;
  final String registered;
  final String updated;
  final int totalOrderCount;
  final int customerGroupId;
  final String customerGroupName;
  final BillingPerson billingPerson;
  final List<dynamic> shippingAddresses;
  final bool taxExempt;
  final bool taxIdValid;
  final bool acceptMarketing;

  factory EcwidCustomerEntity.fromJson(Map<String, dynamic> json) => EcwidCustomerEntity(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    registered: json["registered"] == null ? null : json["registered"],
    updated: json["updated"] == null ? null : json["updated"],
    totalOrderCount: json["totalOrderCount"] == null ? null : json["totalOrderCount"],
    customerGroupId: json["customerGroupId"] == null ? null : json["customerGroupId"],
    customerGroupName: json["customerGroupName"] == null ? null : json["customerGroupName"],
    billingPerson: json["billingPerson"] == null ? null : BillingPerson.fromJson(json["billingPerson"]),
    shippingAddresses: json["shippingAddresses"] == null ? null : List<dynamic>.from(json["shippingAddresses"].map((x) => x)),
    taxExempt: json["taxExempt"] == null ? null : json["taxExempt"],
    taxIdValid: json["taxIdValid"] == null ? null : json["taxIdValid"],
    acceptMarketing: json["acceptMarketing"] == null ? null : json["acceptMarketing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "registered": registered == null ? null : registered,
    "updated": updated == null ? null : updated,
    "totalOrderCount": totalOrderCount == null ? null : totalOrderCount,
    "customerGroupId": customerGroupId == null ? null : customerGroupId,
    "customerGroupName": customerGroupName == null ? null : customerGroupName,
    "billingPerson": billingPerson == null ? null : billingPerson.toJson(),
    "shippingAddresses": shippingAddresses == null ? null : List<dynamic>.from(shippingAddresses.map((x) => x)),
    "taxExempt": taxExempt == null ? null : taxExempt,
    "taxIdValid": taxIdValid == null ? null : taxIdValid,
    "acceptMarketing": acceptMarketing == null ? null : acceptMarketing,
  };
}

class BillingPerson {
  BillingPerson({
    this.name,
  });

  final String name;

  factory BillingPerson.fromJson(Map<String, dynamic> json) => BillingPerson(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };
}
