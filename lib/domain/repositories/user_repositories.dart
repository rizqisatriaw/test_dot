import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/constants/api_const.dart';
import '../../utils/global_dio.dart';
import '../models/user_response.dart';

class UserRepositories {
  Future<UserResponse?> getUserData() async {
    try {
      final response = await globalDio.get(ApiConst.userUrl);
      log(ApiConst.userUrl.toString());
      return UserResponse.fromJson(response.data);
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
