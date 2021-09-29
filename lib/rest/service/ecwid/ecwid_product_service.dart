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
import 'package:baja_app/rest/entity/ecwid/ecwid_product_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';

import '../../get_request.dart';
import '../crud_service.dart';

class EcwidProductService extends CrudService<EcwidProductEntity>{

  static EcwidProductService operations(){
    return new EcwidProductService();
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> subCategoryProduct(int categoryId) async {
    String sessionToken = settingRepo.sessionToken.value;
    //72295673
    return await getRequest("https://app.ecwid.com/api/v3/27622118/products?token=secret_HqVLhZBA44p7vGhpfRiYMvyQKL33EbPJ&category=$categoryId", false, ecwid: true);
  }

}