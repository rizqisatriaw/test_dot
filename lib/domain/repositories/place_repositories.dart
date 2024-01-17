import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_dot/domain/models/place_response.dart';

import '../../utils/constants/api_const.dart';
import '../../utils/global_dio.dart';

class PlaceRepositories {
  Future<PlaceResponse?> getPlaceData() async {
    try {
      final response = await globalDio.get(ApiConst.placeUrl);
      log(response.data.toString());
      return PlaceResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return null;
      } else {
        return null;
      }
    }
  }
}
