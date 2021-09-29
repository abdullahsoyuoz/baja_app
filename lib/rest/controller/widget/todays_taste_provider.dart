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
import 'package:baja_app/rest/entity/widget/occasions_entity.dart';
import 'package:baja_app/rest/entity/widget/shopping_category_entity.dart';
import 'package:baja_app/rest/entity/widget/todays_taste_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/home_widget_service.dart';
import 'package:flutter/material.dart';

class ToDaysTasteProvider with ChangeNotifier {

  List<ToDaysTasteEntity>  _toDaysTasteListData = new List();

  List<ToDaysTasteEntity> get toDaysTasteListData => _toDaysTasteListData;

  set toDaysTasteListData(List<ToDaysTasteEntity> value) {
    _toDaysTasteListData = value;
  }

  getToDaysTasteListController() async {
    toDaysTasteListData.clear();
    BaseResponse response = await HomeWidgetService.operations().occasionsWidget();
    try{
      if (response is OkResponse) {
        if (response.bodyList != null) {
          List<dynamic> dataList = response.bodyList;
          List<ToDaysTasteEntity> newDataList = new List();
          for (var dataStr in dataList) {
            ToDaysTasteEntity model = new ToDaysTasteEntity.fromJson(dataStr);
            if (model != null) {
              newDataList.add(model);
            }
          }
          toDaysTasteListData.addAll(newDataList);
          notifyListeners();
        }
      }
    }catch(e){
      print('Exception ToDaysTaste List Data -- $e');
    }
  }
}
