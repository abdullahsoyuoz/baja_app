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
import 'package:baja_app/rest/entity/ecwid/ecwid_product_entity.dart';
import 'package:baja_app/rest/entity/ecwid/ecwid_subcategory_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/ecwid/ecwid_categories_service.dart';
import 'package:baja_app/rest/service/ecwid/ecwid_product_service.dart';
import 'package:flutter/material.dart';

class EcwidSubCategoriesProvider with ChangeNotifier {

  List<EcwidSubCategoryEntity>  _ecwidSubCategoryListData = new List();

  List<EcwidSubCategoryEntity> get ecwidSubCategoryListData =>
      _ecwidSubCategoryListData;

  set ecwidSubCategoryListData(List<EcwidSubCategoryEntity> value) {
    _ecwidSubCategoryListData = value;
  }

  List<EcwidProductEntity>  _ecwidProductListData = new List();

  List<EcwidProductEntity> get ecwidProductListData => _ecwidProductListData;

  set ecwidProductListData(List<EcwidProductEntity> value) {
    _ecwidProductListData = value;
  }

  getEcwidSubCategoryListController(int categoryId) async {
    ecwidSubCategoryListData.clear();
    BaseResponse response = await EcwidCategoriesService.operations().subCategoryService(categoryId);
    try{
      if (response is OkResponse) {
        if (response.body != null) {
          if (response.body["items"] != null) {
            List<dynamic> dataList = response.body["items"];
            List<EcwidSubCategoryEntity> newDataList = new List();
            for (var dataStr in dataList) {
              EcwidSubCategoryEntity model = new EcwidSubCategoryEntity.fromJson(dataStr);
              if (model != null) {
                newDataList.add(model);
                print('SubCategory ${model.name} -- ${model.parentId}');
              }
            }
            if(newDataList.length>0){
              int subCategoryId = newDataList[0].id;
              getEcwidProductListController(subCategoryId);
            }else{
              ecwidProductListData.clear();
              notifyListeners();
            }
            ecwidSubCategoryListData.addAll(newDataList);
            notifyListeners();
          }
        }
      }
    }catch(e){
      print('Exception EcwidSubCategory List Data -- $e');
    }
  }


  getEcwidProductListController(int subCategoryId) async {
    ecwidProductListData.clear();
    BaseResponse response = await EcwidProductService.operations().subCategoryProduct(subCategoryId);
    try{
      if (response is OkResponse) {
        if (response.body != null) {
          if (response.body["items"] != null) {
            List<dynamic> dataList = response.body["items"];
            List<EcwidProductEntity> newDataList = new List();
            for (var dataStr in dataList) {
              EcwidProductEntity model = new EcwidProductEntity.fromJson(dataStr);
              if (model != null) {
                ecwidProductListData.add(model);
                print('Ecwid Product---- ${model.name} -- ${model.price}');
              }
            }
            //ecwidProductListData.addAll(newDataList);
            notifyListeners();
          }
        }
      }
    }catch(e){
      notifyListeners();
      print('Exception EcwidProduct List Data -- $e');
    }
  }


}
