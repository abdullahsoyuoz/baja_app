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

class SetCurrencyEntity extends Persistent{
  SetCurrencyEntity({
    this.currency,
  });

  final String currency;

  factory SetCurrencyEntity.fromJson(Map<String, dynamic> json) => SetCurrencyEntity(
    currency: json["currency"] == null ? null : json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency == null ? null : currency,
  };
}