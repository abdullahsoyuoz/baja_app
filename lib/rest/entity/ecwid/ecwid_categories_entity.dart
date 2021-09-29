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

class EcwidCategoryEntity extends Persistent{
  EcwidCategoryEntity({
    this.id,
    this.parentId,
    this.orderBy,
    this.hdThumbnailUrl,
    this.thumbnailUrl,
    this.originalImageUrl,
    this.imageUrl,
    this.originalImage,
    this.thumbnail,
    this.borderInfo,
    this.name,
    this.nameTranslated,
    this.url,
    this.productCount,
    this.description,
    this.descriptionTranslated,
    this.enabled,
    this.isSampleCategory,
  });

  final int id;
  final int parentId;
  final int orderBy;
  final String hdThumbnailUrl;
  final String thumbnailUrl;
  final String originalImageUrl;
  final String imageUrl;
  final OriginalImage originalImage;
  final OriginalImage thumbnail;
  final BorderInfo borderInfo;
  final String name;
  final Translated nameTranslated;
  final String url;
  final int productCount;
  final String description;
  final Translated descriptionTranslated;
  final bool enabled;
  final bool isSampleCategory;

  factory EcwidCategoryEntity.fromJson(Map<String, dynamic> json) => EcwidCategoryEntity(
    id: json["id"] == null ? null : json["id"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    orderBy: json["orderBy"] == null ? null : json["orderBy"],
    hdThumbnailUrl: json["hdThumbnailUrl"] == null ? null : json["hdThumbnailUrl"],
    thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
    originalImageUrl: json["originalImageUrl"] == null ? null : json["originalImageUrl"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    originalImage: json["originalImage"] == null ? null : OriginalImage.fromJson(json["originalImage"]),
    thumbnail: json["thumbnail"] == null ? null : OriginalImage.fromJson(json["thumbnail"]),
    borderInfo: json["borderInfo"] == null ? null : BorderInfo.fromJson(json["borderInfo"]),
    name: json["name"] == null ? null : json["name"],
    nameTranslated: json["nameTranslated"] == null ? null : Translated.fromJson(json["nameTranslated"]),
    url: json["url"] == null ? null : json["url"],
    productCount: json["productCount"] == null ? null : json["productCount"],
    description: json["description"] == null ? null : json["description"],
    descriptionTranslated: json["descriptionTranslated"] == null ? null : Translated.fromJson(json["descriptionTranslated"]),
    enabled: json["enabled"] == null ? null : json["enabled"],
    isSampleCategory: json["isSampleCategory"] == null ? null : json["isSampleCategory"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "parentId": parentId == null ? null : parentId,
    "orderBy": orderBy == null ? null : orderBy,
    "hdThumbnailUrl": hdThumbnailUrl == null ? null : hdThumbnailUrl,
    "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
    "originalImageUrl": originalImageUrl == null ? null : originalImageUrl,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "originalImage": originalImage == null ? null : originalImage.toJson(),
    "thumbnail": thumbnail == null ? null : thumbnail.toJson(),
    "borderInfo": borderInfo == null ? null : borderInfo.toJson(),
    "name": name == null ? null : name,
    "nameTranslated": nameTranslated == null ? null : nameTranslated.toJson(),
    "url": url == null ? null : url,
    "productCount": productCount == null ? null : productCount,
    "description": description == null ? null : description,
    "descriptionTranslated": descriptionTranslated == null ? null : descriptionTranslated.toJson(),
    "enabled": enabled == null ? null : enabled,
    "isSampleCategory": isSampleCategory == null ? null : isSampleCategory,
  };
}

class BorderInfo {
  BorderInfo({
    this.dominatingColor,
    this.homogeneity,
  });

  final DominatingColor dominatingColor;
  final bool homogeneity;

  factory BorderInfo.fromJson(Map<String, dynamic> json) => BorderInfo(
    dominatingColor: json["dominatingColor"] == null ? null : DominatingColor.fromJson(json["dominatingColor"]),
    homogeneity: json["homogeneity"] == null ? null : json["homogeneity"],
  );

  Map<String, dynamic> toJson() => {
    "dominatingColor": dominatingColor == null ? null : dominatingColor.toJson(),
    "homogeneity": homogeneity == null ? null : homogeneity,
  };
}

class DominatingColor {
  DominatingColor({
    this.red,
    this.green,
    this.blue,
    this.alpha,
  });

  final int red;
  final int green;
  final int blue;
  final int alpha;

  factory DominatingColor.fromJson(Map<String, dynamic> json) => DominatingColor(
    red: json["red"] == null ? null : json["red"],
    green: json["green"] == null ? null : json["green"],
    blue: json["blue"] == null ? null : json["blue"],
    alpha: json["alpha"] == null ? null : json["alpha"],
  );

  Map<String, dynamic> toJson() => {
    "red": red == null ? null : red,
    "green": green == null ? null : green,
    "blue": blue == null ? null : blue,
    "alpha": alpha == null ? null : alpha,
  };
}

class Translated {
  Translated({
    this.ar,
    this.en,
  });

  final String ar;
  final String en;

  factory Translated.fromJson(Map<String, dynamic> json) => Translated(
    ar: json["ar"] == null ? null : json["ar"],
    en: json["en"] == null ? null : json["en"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar == null ? null : ar,
    "en": en == null ? null : en,
  };
}

class OriginalImage {
  OriginalImage({
    this.url,
    this.width,
    this.height,
  });

  final String url;
  final int width;
  final int height;

  factory OriginalImage.fromJson(Map<String, dynamic> json) => OriginalImage(
    url: json["url"] == null ? null : json["url"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
  };
}
