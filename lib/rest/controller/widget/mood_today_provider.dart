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
import 'package:baja_app/rest/entity/widget/mood_today_entity.dart';
import 'package:baja_app/rest/entity/widget/occasions_entity.dart';
import 'package:baja_app/rest/entity/widget/shopping_category_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/home_widget_service.dart';
import 'package:flutter/material.dart';

class MoodToDayProvider with ChangeNotifier {

  List<MoodTodayEntity>  _moodTodayListData = new List();

  List<MoodTodayEntity> get moodTodayListData => _moodTodayListData;

  set moodTodayListData(List<MoodTodayEntity> value) {
    _moodTodayListData = value;
  }

  getMoodToDayListController() async {
    moodTodayListData.clear();
    BaseResponse response = await HomeWidgetService.operations().moodTodayWidget();
    try{
      if (response is OkResponse) {
        if (response.bodyList != null) {
          List<dynamic> dataList = response.bodyList;
          List<MoodTodayEntity> newDataList = new List();
          for (var dataStr in dataList) {
            MoodTodayEntity model = new MoodTodayEntity.fromJson(dataStr);
            if (model != null) {
              newDataList.add(model);
              print('MoodToday--- ${model.name}');
            }
          }
          moodTodayListData.addAll(newDataList);
          notifyListeners();
        }
      }
    }catch(e){
      print('Exception MoodToDay List Data -- $e');
    }
  }
}
