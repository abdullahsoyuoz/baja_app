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
import 'package:baja_app/rest/entity/widget/side_category_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/home_widget_service.dart';
import 'package:flutter/material.dart';

class SideCategoryProvider with ChangeNotifier {

  List<SideCategoryEntity>  _sideCategoryListData = new List();


  List<SideCategoryEntity> get sideCategoryListData => _sideCategoryListData;

  set sideCategoryListData(List<SideCategoryEntity> value) {
    _sideCategoryListData = value;
  }

  getSideCategoryListController() async {
    sideCategoryListData.clear();
    BaseResponse response = await HomeWidgetService.operations().sideCategoryWidget();
    try{
      if (response is OkResponse) {
        if (response.bodyList != null) {
          List<dynamic> dataList = response.bodyList;
          List<SideCategoryEntity> newDataList = new List();
          for (var dataStr in dataList) {
            SideCategoryEntity model = new SideCategoryEntity.fromJson(dataStr);
            if (model != null) {
              newDataList.add(model);
            }
          }
          sideCategoryListData.addAll(newDataList);
          notifyListeners();
        }
      }
    }catch(e){
      print('Exception Side Category List Data -- $e');
    }
  }
}
