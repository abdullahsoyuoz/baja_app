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


import 'dart:convert';

import '../persistent.dart';

class RegisterEntity extends Persistent{
  RegisterEntity({
    this.phone,
    this.email,
    this.password,
  });

  String phone;
  String email;
  String password;

  factory RegisterEntity.fromJson(Map<String, dynamic> json) => RegisterEntity(
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
  };
}
