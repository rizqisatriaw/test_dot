import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/constants/api_const.dart';
import '../../utils/global_dio.dart';
import '../models/gallery_response.dart';

class GalleryRepositories {
  Future<GalleryResponse?> getGalleryData() async {
    try {
      final response = await globalDio.get(ApiConst.galleryUrl);
      log(ApiConst.galleryUrl.toString());
      return GalleryResponse.fromJson(response.data);
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
