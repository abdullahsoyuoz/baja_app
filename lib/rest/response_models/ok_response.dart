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

import 'base_response.dart';

class OkResponse implements BaseResponse {
  Map<String, dynamic> body;
  List<dynamic> bodyList;
  String message;
  int statusCode;
  OkResponse();
}
