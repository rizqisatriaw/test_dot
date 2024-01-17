import 'package:get/get.dart';

import 'controller/main_section_controller.dart';

class MainSectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainSectionController());
  }
}
