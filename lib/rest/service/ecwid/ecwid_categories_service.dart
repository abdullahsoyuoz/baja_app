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
import 'package:baja_app/rest/entity/ecwid/ecwid_categories_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';

import '../../get_request.dart';
import '../../post_request.dart';
import '../crud_service.dart';

class EcwidCategoriesService extends CrudService<EcwidCategoryEntity>{

  static EcwidCategoriesService operations(){
    return new EcwidCategoriesService();
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> categoryService() async {
    return await getRequest("$apiURL/ecwid/categories", false, ecwid: true);
  }

  //TODO AUTH_TOKEN BEARER
  Future<BaseResponse> subCategoryService(int subCategoryId) async {
    String sessionToken = settingRepo.sessionToken.value;
    //72295673
    return await getRequest("https://app.ecwid.com/api/v3/27622118/categories?token=secret_HqVLhZBA44p7vGhpfRiYMvyQKL33EbPJ&parent=$subCategoryId", false,ecwid: true);
  }
}