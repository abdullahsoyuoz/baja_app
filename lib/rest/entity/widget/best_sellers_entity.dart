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


class BestSellerEntity extends Persistent{
  BestSellerEntity({
    this.id,
    this.sku,
    this.thumbnailUrl,
    this.unlimited,
    this.inStock,
    this.name,
    this.nameTranslated,
    this.price,
    this.priceInProductList,
    this.defaultDisplayedPrice,
    this.defaultDisplayedPriceFormatted,
    this.tax,
    this.isShippingRequired,
    this.weight,
    this.url,
    this.created,
    this.updated,
    this.createTimestamp,
    this.updateTimestamp,
    this.productClassId,
    this.enabled,
    this.options,
    this.warningLimit,
    this.fixedShippingRateOnly,
    this.fixedShippingRate,
    this.shipping,
    this.defaultCombinationId,
    this.imageUrl,
    this.smallThumbnailUrl,
    this.hdThumbnailUrl,
    this.originalImageUrl,
    this.originalImage,
    this.borderInfo,
    this.description,
    this.descriptionTranslated,
    this.galleryImages,
    this.media,
    this.categoryIds,
    this.categories,
    this.defaultCategoryId,
    this.seoTitle,
    this.seoDescription,
    this.favorites,
    this.attributes,
    this.files,
    this.relatedProducts,
    this.combinations,
    this.dimensions,
    this.isSampleProduct,
    this.googleItemCondition,
    this.isGiftCard,
    this.discountsAllowed,
    this.nameYourPriceEnabled,
    this.productCondition,
  });

  final int id;
  final String sku;
  final String thumbnailUrl;
  final bool unlimited;
  final bool inStock;
  final String name;
  final Translated nameTranslated;
  final dynamic price;
  final dynamic priceInProductList;
  final dynamic defaultDisplayedPrice;
  final String defaultDisplayedPriceFormatted;
  final Tax tax;
  final bool isShippingRequired;
  final int weight;
  final String url;
  final String created;
  final String updated;
  final int createTimestamp;
  final int updateTimestamp;
  final int productClassId;
  final bool enabled;
  final List<dynamic> options;
  final int warningLimit;
  final bool fixedShippingRateOnly;
  final int fixedShippingRate;
  final Shipping shipping;
  final int defaultCombinationId;
  final String imageUrl;
  final String smallThumbnailUrl;
  final String hdThumbnailUrl;
  final String originalImageUrl;
  final OriginalImage originalImage;
  final BorderInfo borderInfo;
  final String description;
  final Translated descriptionTranslated;
  final List<dynamic> galleryImages;
  final Media media;
  final List<int> categoryIds;
  final List<Category> categories;
  final int defaultCategoryId;
  final String seoTitle;
  final String seoDescription;
  final Favorites favorites;
  final List<Attribute> attributes;
  final List<dynamic> files;
  final RelatedProducts relatedProducts;
  final List<dynamic> combinations;
  final Dimensions dimensions;
  final bool isSampleProduct;
  final String googleItemCondition;
  final bool isGiftCard;
  final bool discountsAllowed;
  final bool nameYourPriceEnabled;
  final String productCondition;

  factory BestSellerEntity.fromJson(Map<String, dynamic> json) => BestSellerEntity(
    id: json["id"] == null ? null : json["id"],
    sku: json["sku"] == null ? null : json["sku"],
    thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
    unlimited: json["unlimited"] == null ? null : json["unlimited"],
    inStock: json["inStock"] == null ? null : json["inStock"],
    name: json["name"] == null ? null : json["name"],
    nameTranslated: json["nameTranslated"] == null ? null : Translated.fromJson(json["nameTranslated"]),
    price: json["price"] == null ? null : json["price"],
    priceInProductList: json["priceInProductList"] == null ? null : json["priceInProductList"],
    defaultDisplayedPrice: json["defaultDisplayedPrice"] == null ? null : json["defaultDisplayedPrice"],
    defaultDisplayedPriceFormatted: json["defaultDisplayedPriceFormatted"] == null ? null : json["defaultDisplayedPriceFormatted"],
    tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
    isShippingRequired: json["isShippingRequired"] == null ? null : json["isShippingRequired"],
    weight: json["weight"] == null ? null : json["weight"],
    url: json["url"] == null ? null : json["url"],
    created: json["created"] == null ? null : json["created"],
    updated: json["updated"] == null ? null : json["updated"],
    createTimestamp: json["createTimestamp"] == null ? null : json["createTimestamp"],
    updateTimestamp: json["updateTimestamp"] == null ? null : json["updateTimestamp"],
    productClassId: json["productClassId"] == null ? null : json["productClassId"],
    enabled: json["enabled"] == null ? null : json["enabled"],
    options: json["options"] == null ? null : List<dynamic>.from(json["options"].map((x) => x)),
    warningLimit: json["warningLimit"] == null ? null : json["warningLimit"],
    fixedShippingRateOnly: json["fixedShippingRateOnly"] == null ? null : json["fixedShippingRateOnly"],
    fixedShippingRate: json["fixedShippingRate"] == null ? null : json["fixedShippingRate"],
    shipping: json["shipping"] == null ? null : Shipping.fromJson(json["shipping"]),
    defaultCombinationId: json["defaultCombinationId"] == null ? null : json["defaultCombinationId"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    smallThumbnailUrl: json["smallThumbnailUrl"] == null ? null : json["smallThumbnailUrl"],
    hdThumbnailUrl: json["hdThumbnailUrl"] == null ? null : json["hdThumbnailUrl"],
    originalImageUrl: json["originalImageUrl"] == null ? null : json["originalImageUrl"],
    originalImage: json["originalImage"] == null ? null : OriginalImage.fromJson(json["originalImage"]),
    borderInfo: json["borderInfo"] == null ? null : BorderInfo.fromJson(json["borderInfo"]),
    description: json["description"] == null ? null : json["description"],
    descriptionTranslated: json["descriptionTranslated"] == null ? null : Translated.fromJson(json["descriptionTranslated"]),
    galleryImages: json["galleryImages"] == null ? null : List<dynamic>.from(json["galleryImages"].map((x) => x)),
    media: json["media"] == null ? null : Media.fromJson(json["media"]),
    categoryIds: json["categoryIds"] == null ? null : List<int>.from(json["categoryIds"].map((x) => x)),
    categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    defaultCategoryId: json["defaultCategoryId"] == null ? null : json["defaultCategoryId"],
    seoTitle: json["seoTitle"] == null ? null : json["seoTitle"],
    seoDescription: json["seoDescription"] == null ? null : json["seoDescription"],
    favorites: json["favorites"] == null ? null : Favorites.fromJson(json["favorites"]),
    attributes: json["attributes"] == null ? null : List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    files: json["files"] == null ? null : List<dynamic>.from(json["files"].map((x) => x)),
    relatedProducts: json["relatedProducts"] == null ? null : RelatedProducts.fromJson(json["relatedProducts"]),
    combinations: json["combinations"] == null ? null : List<dynamic>.from(json["combinations"].map((x) => x)),
    dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
    isSampleProduct: json["isSampleProduct"] == null ? null : json["isSampleProduct"],
    googleItemCondition: json["googleItemCondition"] == null ? null : json["googleItemCondition"],
    isGiftCard: json["isGiftCard"] == null ? null : json["isGiftCard"],
    discountsAllowed: json["discountsAllowed"] == null ? null : json["discountsAllowed"],
    nameYourPriceEnabled: json["nameYourPriceEnabled"] == null ? null : json["nameYourPriceEnabled"],
    productCondition: json["productCondition"] == null ? null : json["productCondition"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "sku": sku == null ? null : sku,
    "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
    "unlimited": unlimited == null ? null : unlimited,
    "inStock": inStock == null ? null : inStock,
    "name": name == null ? null : name,
    "nameTranslated": nameTranslated == null ? null : nameTranslated.toJson(),
    "price": price == null ? null : price,
    "priceInProductList": priceInProductList == null ? null : priceInProductList,
    "defaultDisplayedPrice": defaultDisplayedPrice == null ? null : defaultDisplayedPrice,
    "defaultDisplayedPriceFormatted": defaultDisplayedPriceFormatted == null ? null : defaultDisplayedPriceFormatted,
    "tax": tax == null ? null : tax.toJson(),
    "isShippingRequired": isShippingRequired == null ? null : isShippingRequired,
    "weight": weight == null ? null : weight,
    "url": url == null ? null : url,
    "created": created == null ? null : created,
    "updated": updated == null ? null : updated,
    "createTimestamp": createTimestamp == null ? null : createTimestamp,
    "updateTimestamp": updateTimestamp == null ? null : updateTimestamp,
    "productClassId": productClassId == null ? null : productClassId,
    "enabled": enabled == null ? null : enabled,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x)),
    "warningLimit": warningLimit == null ? null : warningLimit,
    "fixedShippingRateOnly": fixedShippingRateOnly == null ? null : fixedShippingRateOnly,
    "fixedShippingRate": fixedShippingRate == null ? null : fixedShippingRate,
    "shipping": shipping == null ? null : shipping.toJson(),
    "defaultCombinationId": defaultCombinationId == null ? null : defaultCombinationId,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "smallThumbnailUrl": smallThumbnailUrl == null ? null : smallThumbnailUrl,
    "hdThumbnailUrl": hdThumbnailUrl == null ? null : hdThumbnailUrl,
    "originalImageUrl": originalImageUrl == null ? null : originalImageUrl,
    "originalImage": originalImage == null ? null : originalImage.toJson(),
    "borderInfo": borderInfo == null ? null : borderInfo.toJson(),
    "description": description == null ? null : description,
    "descriptionTranslated": descriptionTranslated == null ? null : descriptionTranslated.toJson(),
    "galleryImages": galleryImages == null ? null : List<dynamic>.from(galleryImages.map((x) => x)),
    "media": media == null ? null : media.toJson(),
    "categoryIds": categoryIds == null ? null : List<dynamic>.from(categoryIds.map((x) => x)),
    "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
    "defaultCategoryId": defaultCategoryId == null ? null : defaultCategoryId,
    "seoTitle": seoTitle == null ? null : seoTitle,
    "seoDescription": seoDescription == null ? null : seoDescription,
    "favorites": favorites == null ? null : favorites.toJson(),
    "attributes": attributes == null ? null : List<dynamic>.from(attributes.map((x) => x.toJson())),
    "files": files == null ? null : List<dynamic>.from(files.map((x) => x)),
    "relatedProducts": relatedProducts == null ? null : relatedProducts.toJson(),
    "combinations": combinations == null ? null : List<dynamic>.from(combinations.map((x) => x)),
    "dimensions": dimensions == null ? null : dimensions.toJson(),
    "isSampleProduct": isSampleProduct == null ? null : isSampleProduct,
    "googleItemCondition": googleItemCondition == null ? null : googleItemCondition,
    "isGiftCard": isGiftCard == null ? null : isGiftCard,
    "discountsAllowed": discountsAllowed == null ? null : discountsAllowed,
    "nameYourPriceEnabled": nameYourPriceEnabled == null ? null : nameYourPriceEnabled,
    "productCondition": productCondition == null ? null : productCondition,
  };
}

class Attribute {
  Attribute({
    this.id,
    this.name,
    this.value,
    this.show,
    this.type,
  });

  final int id;
  final String name;
  final String value;
  final String show;
  final String type;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    value: json["value"] == null ? null : json["value"],
    show: json["show"] == null ? null : json["show"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "value": value == null ? null : value,
    "show": show == null ? null : show,
    "type": type == null ? null : type,
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

class Category {
  Category({
    this.id,
    this.enabled,
  });

  final int id;
  final bool enabled;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    enabled: json["enabled"] == null ? null : json["enabled"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "enabled": enabled == null ? null : enabled,
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

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  final int length;
  final int width;
  final int height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"] == null ? null : json["length"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toJson() => {
    "length": length == null ? null : length,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
  };
}

class Favorites {
  Favorites({
    this.count,
    this.displayedCount,
  });

  final int count;
  final String displayedCount;

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
    count: json["count"] == null ? null : json["count"],
    displayedCount: json["displayedCount"] == null ? null : json["displayedCount"],
  );

  Map<String, dynamic> toJson() => {
    "count": count == null ? null : count,
    "displayedCount": displayedCount == null ? null : displayedCount,
  };
}

class Media {
  Media({
    this.images,
  });

  final List<ImageData> images;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    images: json["images"] == null ? null : List<ImageData>.from(json["images"].map((x) => ImageData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class ImageData {
  ImageData({
    this.id,
    this.isMain,
    this.orderBy,
    this.image160PxUrl,
    this.image400PxUrl,
    this.image800PxUrl,
    this.image1500PxUrl,
    this.imageOriginalUrl,
  });

  final String id;
  final bool isMain;
  final int orderBy;
  final String image160PxUrl;
  final String image400PxUrl;
  final String image800PxUrl;
  final String image1500PxUrl;
  final String imageOriginalUrl;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    id: json["id"] == null ? null : json["id"],
    isMain: json["isMain"] == null ? null : json["isMain"],
    orderBy: json["orderBy"] == null ? null : json["orderBy"],
    image160PxUrl: json["image160pxUrl"] == null ? null : json["image160pxUrl"],
    image400PxUrl: json["image400pxUrl"] == null ? null : json["image400pxUrl"],
    image800PxUrl: json["image800pxUrl"] == null ? null : json["image800pxUrl"],
    image1500PxUrl: json["image1500pxUrl"] == null ? null : json["image1500pxUrl"],
    imageOriginalUrl: json["imageOriginalUrl"] == null ? null : json["imageOriginalUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "isMain": isMain == null ? null : isMain,
    "orderBy": orderBy == null ? null : orderBy,
    "image160pxUrl": image160PxUrl == null ? null : image160PxUrl,
    "image400pxUrl": image400PxUrl == null ? null : image400PxUrl,
    "image800pxUrl": image800PxUrl == null ? null : image800PxUrl,
    "image1500pxUrl": image1500PxUrl == null ? null : image1500PxUrl,
    "imageOriginalUrl": imageOriginalUrl == null ? null : imageOriginalUrl,
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

class RelatedProducts {
  RelatedProducts({
    this.productIds,
    this.relatedCategory,
  });

  final List<dynamic> productIds;
  final RelatedCategory relatedCategory;

  factory RelatedProducts.fromJson(Map<String, dynamic> json) => RelatedProducts(
    productIds: json["productIds"] == null ? null : List<dynamic>.from(json["productIds"].map((x) => x)),
    relatedCategory: json["relatedCategory"] == null ? null : RelatedCategory.fromJson(json["relatedCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "productIds": productIds == null ? null : List<dynamic>.from(productIds.map((x) => x)),
    "relatedCategory": relatedCategory == null ? null : relatedCategory.toJson(),
  };
}

class RelatedCategory {
  RelatedCategory({
    this.enabled,
    this.categoryId,
    this.productCount,
  });

  final bool enabled;
  final int categoryId;
  final int productCount;

  factory RelatedCategory.fromJson(Map<String, dynamic> json) => RelatedCategory(
    enabled: json["enabled"] == null ? null : json["enabled"],
    categoryId: json["categoryId"] == null ? null : json["categoryId"],
    productCount: json["productCount"] == null ? null : json["productCount"],
  );

  Map<String, dynamic> toJson() => {
    "enabled": enabled == null ? null : enabled,
    "categoryId": categoryId == null ? null : categoryId,
    "productCount": productCount == null ? null : productCount,
  };
}

class Shipping {
  Shipping({
    this.type,
    this.methodMarkup,
    this.flatRate,
    this.disabledMethods,
    this.enabledMethods,
  });

  final String type;
  final int methodMarkup;
  final int flatRate;
  final List<dynamic> disabledMethods;
  final List<dynamic> enabledMethods;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    type: json["type"] == null ? null : json["type"],
    methodMarkup: json["methodMarkup"] == null ? null : json["methodMarkup"],
    flatRate: json["flatRate"] == null ? null : json["flatRate"],
    disabledMethods: json["disabledMethods"] == null ? null : List<dynamic>.from(json["disabledMethods"].map((x) => x)),
    enabledMethods: json["enabledMethods"] == null ? null : List<dynamic>.from(json["enabledMethods"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "methodMarkup": methodMarkup == null ? null : methodMarkup,
    "flatRate": flatRate == null ? null : flatRate,
    "disabledMethods": disabledMethods == null ? null : List<dynamic>.from(disabledMethods.map((x) => x)),
    "enabledMethods": enabledMethods == null ? null : List<dynamic>.from(enabledMethods.map((x) => x)),
  };
}

class Tax {
  Tax({
    this.taxable,
    this.defaultLocationIncludedTaxRate,
    this.enabledManualTaxes,
  });

  final bool taxable;
  final int defaultLocationIncludedTaxRate;
  final List<int> enabledManualTaxes;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
    taxable: json["taxable"] == null ? null : json["taxable"],
    defaultLocationIncludedTaxRate: json["defaultLocationIncludedTaxRate"] == null ? null : json["defaultLocationIncludedTaxRate"],
    enabledManualTaxes: json["enabledManualTaxes"] == null ? null : List<int>.from(json["enabledManualTaxes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "taxable": taxable == null ? null : taxable,
    "defaultLocationIncludedTaxRate": defaultLocationIncludedTaxRate == null ? null : defaultLocationIncludedTaxRate,
    "enabledManualTaxes": enabledManualTaxes == null ? null : List<dynamic>.from(enabledManualTaxes.map((x) => x)),
  };
}
