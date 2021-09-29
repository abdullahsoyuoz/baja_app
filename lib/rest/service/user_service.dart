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
import 'package:baja_app/rest/entity/login_entity.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;
import 'package:baja_app/rest/response_models/base_response.dart';

import '../get_request.dart';
import '../post_request.dart';
import 'crud_service.dart';

class UserService extends CrudService<RegisterEntity>{

  static UserService operations(){
    return new UserService();
  }

  //TODO AUTH_TOKEN LOOSE
  Future<BaseResponse> loginUser(LoginEntity loginEntity) async {
    return await postRequest("$apiURL/login_check",false, model: loginEntity,);
  }

  //TODO AUTH_TOKEN LOOSE
  Future<BaseResponse> registerUser(RegisterEntity registerEntity) async {
    return await postRequest("$apiURL/register", false, model: registerEntity);
  }

  //TODO AUTH_TOKEN LOOSE
  Future<BaseResponse> refreshToken(String refreshToken) async {
    return await postRequest("$apiURL/token/refresh?refresh_token=$refreshToken", false);
  }

}