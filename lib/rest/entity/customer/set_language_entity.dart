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

class SetLanguageEntity extends Persistent{
  SetLanguageEntity({
    this.language,
  });

  final String language;

  factory SetLanguageEntity.fromJson(Map<String, dynamic> json) => SetLanguageEntity(
    language: json["language"] == null ? null : json["language"],
  );

  Map<String, dynamic> toJson() => {
    "language": language == null ? null : language,
  };
}