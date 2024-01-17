import 'package:flutter/material.dart';
import 'package:test_dot/config/themes/color_theme.dart';

import '../../controller/main_section_controller.dart';

class UserSections extends StatelessWidget {
  UserSections({Key? key}) : super(key: key);
  final controller = MainSectionController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.white,
    );
  }
}
