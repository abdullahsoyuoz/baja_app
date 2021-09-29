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

import 'package:baja_app/rest/entity/widget/baja_express_entity.dart';
import 'package:baja_app/rest/entity/widget/shopping_category_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/home_widget_service.dart';
import 'package:flutter/material.dart';

class ShoppingCategoryProvider with ChangeNotifier {

  List<ShoppingCategoryEntity>  _shoppingCategoryListData = new List();

  List<ShoppingCategoryEntity> get shoppingCategoryListData =>
      _shoppingCategoryListData;

  set shoppingCategoryListData(List<ShoppingCategoryEntity> value) {
    _shoppingCategoryListData = value;
  }

  getShoppingCategoryListController() async {
    shoppingCategoryListData.clear();
    BaseResponse response = await HomeWidgetService.operations().shoppingCategory();
    try{
      if (response is OkResponse) {
        if (response.bodyList != null) {
          List<dynamic> dataList = response.bodyList;
          List<ShoppingCategoryEntity> newDataList = new List();
          for (var dataStr in dataList) {
            ShoppingCategoryEntity model = new ShoppingCategoryEntity.fromJson(dataStr);
            if (model != null) {
              newDataList.add(model);
            }
          }
          shoppingCategoryListData.addAll(newDataList);
          notifyListeners();
        }
      }
    }catch(e){
      print('Exception Shopping Category List Data -- $e');
    }
  }
}
