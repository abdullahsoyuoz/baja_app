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

import 'package:baja_app/rest/entity/customer/change_password_entity.dart';
import 'package:baja_app/rest/entity/customer/set_currency_entity.dart';
import 'package:baja_app/rest/entity/customer/set_language_entity.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;
import 'package:baja_app/rest/response_models/base_response.dart';

import '../post_request.dart';
import 'crud_service.dart';

class CustomerService extends CrudService<SetLanguageEntity>{

  static CustomerService operations(){
    return new CustomerService();
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> setCurrency(SetCurrencyEntity setCurrencyEntity) async {
    String sessionToken = settingRepo.sessionToken.value;
    return await postRequest("$apiURL/authenticated/set-currency", false,bearerToken: sessionToken, model: setCurrencyEntity);
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> changePassword(ChangePasswordEntity changePasswordEntity) async {
    String sessionToken = settingRepo.sessionToken.value;
    return await postRequest("$apiURL/authenticated/change-password", false,bearerToken: sessionToken, model: changePasswordEntity);
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> setLanguage(SetLanguageEntity setLanguageEntity) async {
    String sessionToken = settingRepo.sessionToken.value;
    return await postRequest("$apiURL/authenticated/set-language", false,bearerToken: sessionToken, model: setLanguageEntity);
  }

}