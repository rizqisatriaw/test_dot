import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_dot/data/shared_preference/local_storage_service.dart';

import '../../../../config/routes/main_route.dart';
import '../../../../utils/debounce_helper.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoginButtonEnabled = RxBool(false);
  DebounceHelper debounce = DebounceHelper(milliseconds: 300);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setLogin() {
    LocalStorageService.setUser(true);
    Get.toNamed(MainRoute.mainSection);
  }
}
