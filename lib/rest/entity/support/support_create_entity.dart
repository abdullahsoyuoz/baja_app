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

class SupportCreateEntity extends Persistent{
  SupportCreateEntity({
    this.supportReasonId,
    this.message,
    this.base64Image,
  });

  final int supportReasonId;
  final String message;
  final String base64Image;

  factory SupportCreateEntity.fromJson(Map<String, dynamic> json) => SupportCreateEntity(
    supportReasonId: json["support_reason_id"] == null ? null : json["support_reason_id"],
    message: json["message"] == null ? null : json["message"],
    base64Image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "support_reason_id": supportReasonId == null ? null : supportReasonId,
    "message": message == null ? null : message,
    "image": base64Image == null ? null : base64Image,
  };
}
