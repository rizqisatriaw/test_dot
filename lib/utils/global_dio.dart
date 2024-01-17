import 'package:dio/dio.dart';

import 'constants/api_const.dart';

Dio globalDio = Dio(
  BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    baseUrl: ApiConst.baseUrl,
    contentType: "application/json",
    responseType: ResponseType.json,
    connectTimeout: const Duration(milliseconds: 10000),
  ),
);
