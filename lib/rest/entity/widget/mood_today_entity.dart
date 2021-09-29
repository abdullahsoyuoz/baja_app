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

class MoodTodayEntity extends Persistent{
  MoodTodayEntity({
    this.id,
    this.parentId,
    this.catId,
    this.thumbUrl,
    this.imageUrl,
    this.name,
    this.nameTranslated,
    this.mobileCatId,
    this.extraImageUrl,
  });

  final int id;
  final int parentId;
  final int catId;
  final String thumbUrl;
  final String imageUrl;
  final String name;
  final NameTranslated nameTranslated;
  final int mobileCatId;
  final dynamic extraImageUrl;

  factory MoodTodayEntity.fromJson(Map<String, dynamic> json) => MoodTodayEntity(
    id: json["id"] == null ? null : json["id"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    catId: json["catId"] == null ? null : json["catId"],
    thumbUrl: json["thumbUrl"] == null ? null : json["thumbUrl"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    name: json["name"] == null ? null : json["name"],
    nameTranslated: json["nameTranslated"] == null ? null : NameTranslated.fromJson(json["nameTranslated"]),
    mobileCatId: json["mobileCatId"] == null ? null : json["mobileCatId"],
    extraImageUrl: json["extraImageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "parentId": parentId == null ? null : parentId,
    "catId": catId == null ? null : catId,
    "thumbUrl": thumbUrl == null ? null : thumbUrl,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "name": name == null ? null : name,
    "nameTranslated": nameTranslated == null ? null : nameTranslated.toJson(),
    "mobileCatId": mobileCatId == null ? null : mobileCatId,
    "extraImageUrl": extraImageUrl,
  };
}

class NameTranslated {
  NameTranslated({
    this.ar,
    this.en,
  });

  final String ar;
  final String en;

  factory NameTranslated.fromJson(Map<String, dynamic> json) => NameTranslated(
    ar: json["ar"] == null ? null : json["ar"],
    en: json["en"] == null ? null : json["en"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar == null ? null : ar,
    "en": en == null ? null : en,
  };
}
