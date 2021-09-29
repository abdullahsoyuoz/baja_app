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

class ChangePasswordEntity extends Persistent {
  ChangePasswordEntity({
    this.password,
    this.passwordNew,
  });

  String password;
  String passwordNew;

  factory ChangePasswordEntity.fromJson(Map<String, dynamic> json) => ChangePasswordEntity(
    password: json["password"] == null ? null : json["password"],
    passwordNew: json["new_password"] == null ? null : json["new_password"],
  );

  Map<String, dynamic> toJson() => {
    "password": password == null ? null : password,
    "new_password": passwordNew == null ? null : passwordNew,
  };
}

