import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_dot/config/themes/color_theme.dart';
import 'package:test_dot/presentations/features/main_sections/controller/main_section_controller.dart';
import 'package:test_dot/presentations/features/main_sections/view/sections/gallery_section.dart';
import 'package:test_dot/presentations/features/main_sections/view/sections/user_sections.dart';
import 'package:test_dot/presentations/widgets/custom_bottom_nav.dart';
import 'package:test_dot/presentations/features/main_sections/view/sections/place_section.dart';

class MainSectionView extends StatelessWidget {
  MainSectionView({Key? key}) : super(key: key);
  final controller = MainSectionController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemes.white,
      body: Obx(
        () => Stack(
          children: [
            IndexedStack(
              index: controller.currentPage.value,
              children: [
                PlaceSection(),
                GallerySection(),
                UserSections(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
