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

class LoginTokenEntity {
  LoginTokenEntity({
    this.token,
    this.refreshToken,
  });

  final String token;
  final String refreshToken;

  factory LoginTokenEntity.fromJson(Map<String, dynamic> json) => LoginTokenEntity(
    token: json["token"] == null ? null : json["token"],
    refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "refresh_token": refreshToken == null ? null : refreshToken,
  };
}
