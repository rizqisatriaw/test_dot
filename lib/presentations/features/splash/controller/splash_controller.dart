import 'dart:async';

import 'package:get/get.dart';
import 'package:test_dot/config/routes/main_route.dart';
import 'package:test_dot/data/shared_preference/local_storage_service.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    Timer(
      const Duration(milliseconds: 2000),
      () async {
        if (await LocalStorageService.checkUser() == true) {
          Get.offAllNamed(MainRoute.mainSection);
        } else {
          Get.offAllNamed(MainRoute.login);
        }
      },
    );
  }
}
