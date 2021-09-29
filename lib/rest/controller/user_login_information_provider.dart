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


import 'package:baja_app/rest/entity/register_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/user_service.dart';
import 'package:flutter/foundation.dart';

class UserLoginInformationProvider with ChangeNotifier {

  RegisterEntity _userLoginInformationEntity = new RegisterEntity();

  RegisterEntity get userLoginInformationEntity =>
      _userLoginInformationEntity;

  set userLoginInformationEntity(RegisterEntity value) {
    _userLoginInformationEntity = value;
  }

  /*getUserInformationDataController() async {
    try{
      BaseResponse response = await UserService.operations().userInformationShow();
      if (response is OkResponse) {
        if (response.body != null) {
          if(response.body['status']){
            if (response.body["data"] != null) {
              RegisterEntity model = new RegisterEntity.fromJson(response.body["data"]);
              if (model != null) {
                //print('USER LOGİN INFORMATİON --- ${model.name} ${model.surname}');
                userLoginInformationEntity = model;
                notifyListeners();
              }
            }
          }
        }
      }
    }catch(e){
      print('Exception User Information Data -- $e');
    }
  }*/
}
