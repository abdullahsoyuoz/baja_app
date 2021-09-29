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

import 'package:baja_app/rest/entity/address/set_address_entity.dart';
import 'package:baja_app/rest/entity/address/user_address_entity.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;
import 'package:baja_app/rest/response_models/base_response.dart';

import '../get_request.dart';
import '../post_request.dart';
import 'crud_service.dart';

class AddressService extends CrudService<UserAddressEntity>{

  static AddressService operations(){
    return new AddressService();
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> userAddress() async {
    String sessionToken = settingRepo.sessionToken.value;
    return await getRequest("$apiURL/authenticated/address",false, bearerToken: sessionToken);
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> setAddress(SetAddressEntity setAddressEntity) async {
    String sessionToken = settingRepo.sessionToken.value;
    return await postRequest("$apiURL/authenticated/address",false, bearerToken: sessionToken, model: setAddressEntity);
  }


}