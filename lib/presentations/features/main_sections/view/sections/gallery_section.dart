import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:test_dot/presentations/widgets/custom_item_gallery.dart';

import '../../../../../config/themes/color_theme.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../controller/main_section_controller.dart';

class GallerySection extends StatelessWidget {
  GallerySection({Key? key}) : super(key: key);
  final controller = MainSectionController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            StickyHeader(
              header: Container(
                width: MediaQuery.of(context).size.width,
                color: ColorThemes.white,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16.w, horizontal: 8.h),
                  alignment: Alignment.center,
                  width: Get.width,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: ColorThemes.primaryColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: CustomTextField(
                    onChange: (value) {
                      controller.searchGallery(value ?? '');
                    },
                    controller: controller.searchController,
                    label: 'Search',
                  ),
                ),
              ),
              content: Obx(
                () => GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.w,
                  ),
                  itemCount: controller.contentLocalGallery.length,
                  itemBuilder: (context, index) {
                    final item = controller.contentLocalGallery[index];
                    return CustomItemGallery(
                      caption: item.caption ?? '',
                      thumbnail: item.thumbnail ?? '',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
