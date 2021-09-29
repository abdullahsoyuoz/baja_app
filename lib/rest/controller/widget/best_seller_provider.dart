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

import 'package:baja_app/rest/entity/widget/best_sellers_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/home_widget_service.dart';
import 'package:flutter/material.dart';

class BestSellerProvider with ChangeNotifier {

  List<BestSellerEntity>  _bestSellerProductList = new List();

  List<BestSellerEntity> get bestSellerProductList => _bestSellerProductList;

  set bestSellerProductList(List<BestSellerEntity> value) {
    _bestSellerProductList = value;
  }

  getBestSellerProductController() async {
    bestSellerProductList.clear();
    BaseResponse response = await HomeWidgetService.operations().bestSellerWidget();
    try{
      if (response is OkResponse) {
        if (response.body != null) {
          if (response.body["items"] != null) {
            List<dynamic> dataList = response.body["items"];
            List<BestSellerEntity> newDataList = new List();
            for (var dataStr in dataList) {
              BestSellerEntity model = new BestSellerEntity.fromJson(dataStr);
              if (model != null) {
                newDataList.add(model);
              }
            }
            bestSellerProductList.addAll(newDataList);
            notifyListeners();
          }
        }
      }
    }catch(e){
      print('Exception Best Seller Data -- $e');
    }
  }
}
