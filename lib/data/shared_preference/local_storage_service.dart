import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService extends GetxService {
  LocalStorageService._();
  static final box = Hive.box('dot');

  static Future<void> setUser(bool isLogin) async {
    await box.put('dot', isLogin.toString());
  }

  static Future<bool> checkUser() async {
    final status = box.get('dot', defaultValue: 'false') as String;

    return status == 'true' ? true : false;
  }
}
