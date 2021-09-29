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

class LoginEntity extends Persistent{
  LoginEntity({
    this.username,
    this.password,
  });

  String username;
  String password;

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "password": password == null ? null : password,
  };
}


