import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_dot/presentations/features/main_sections/controller/main_section_controller.dart';
import 'package:test_dot/presentations/widgets/custom_item_bottom_nav.dart';

import '../../config/themes/color_theme.dart';
import '../../utils/constants/assets_const.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({Key? key}) : super(key: key);

  final controller = MainSectionController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorThemes.white,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomItemBottomNav(
              isActive: controller.currentPage.value == 0,
              image: controller.currentPage.value == 0
                  ? AssetsConst.placeOn
                  : AssetsConst.placeOff,
              title: 'Place',
              onTap: () => controller.updateTab(0),
            ),
            CustomItemBottomNav(
              isActive: controller.currentPage.value == 1,
              image: controller.currentPage.value == 1
                  ? AssetsConst.galleryOn
                  : AssetsConst.galleryOff,
              title: 'Gallery',
              onTap: () => controller.updateTab(1),
            ),
            CustomItemBottomNav(
              isActive: controller.currentPage.value == 2,
              image: controller.currentPage.value == 2
                  ? AssetsConst.userOn
                  : AssetsConst.userOff,
              title: 'User',
              onTap: () => controller.updateTab(2),
            )
          ],
        ),
      ),
    );
  }
}
