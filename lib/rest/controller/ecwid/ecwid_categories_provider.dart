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

import 'package:baja_app/rest/entity/ecwid/ecwid_categories_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/ecwid/ecwid_categories_service.dart';
import 'package:flutter/material.dart';

class EcwidCategoriesProvider with ChangeNotifier {

  List<EcwidCategoryEntity>  _ecwidCategoryListData = new List();

  List<EcwidCategoryEntity> get ecwidCategoryListData => _ecwidCategoryListData;

  set ecwidCategoryListData(List<EcwidCategoryEntity> value) {
    _ecwidCategoryListData = value;
  }

  getEcwidCategoryListController() async {
    ecwidCategoryListData.clear();
    BaseResponse response = await EcwidCategoriesService.operations().categoryService();
    try{
      if (response is OkResponse) {
        if (response.body != null) {
          if (response.body["items"] != null) {
            List<dynamic> dataList = response.body["items"];
            List<EcwidCategoryEntity> newDataList = new List();
            for (var dataStr in dataList) {
              EcwidCategoryEntity model = new EcwidCategoryEntity.fromJson(dataStr);
              if (model != null) {
                newDataList.add(model);
               print('EcwidCategory-- ${model.name} -- ${model.parentId}');
              }
            }
            ecwidCategoryListData.addAll(newDataList);
            notifyListeners();
          }
        }
      }
    }catch(e){
      print('Exception EcwidCategory List Data -- $e');
    }
  }
}
