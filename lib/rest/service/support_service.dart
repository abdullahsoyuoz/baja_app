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

import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;
import 'package:baja_app/rest/entity/support/support_create_entity.dart';
import 'package:baja_app/rest/entity/support/support_reasons_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';

import '../get_request.dart';
import '../post_request.dart';
import 'crud_service.dart';

class SupportService extends CrudService<SupportReasonEntity>{

  static SupportService operations(){
    return new SupportService();
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> supportReasons() async {
    String sessionToken = settingRepo.sessionToken.value;
    return await getRequest("$apiURL/authenticated/support/reasons",false, bearerToken: sessionToken);
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> supportCreate(SupportCreateEntity supportCreateEntity) async {
    String sessionToken = settingRepo.sessionToken.value;
    return await postRequest("$apiURL/authenticated/address", false,bearerToken: sessionToken, model: supportCreateEntity);
  }

}