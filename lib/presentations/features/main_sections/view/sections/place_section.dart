import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../../../../config/themes/color_theme.dart';
import '../../controller/main_section_controller.dart';
import '../../../../widgets/custom_item_place.dart';
import '../../../../widgets/custom_text_field.dart';

class PlaceSection extends StatelessWidget {
  PlaceSection({Key? key}) : super(key: key);
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
                      controller.search(value ?? '');
                    },
                    controller: controller.searchController,
                    label: 'Search',
                  ),
                ),
              ),
              content: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.contentLocal.length,
                  itemBuilder: (context, index) {
                    final item = controller.contentLocal[index];
                    return CustomItemPlace(
                      image: item.image != null
                          ? item.image ?? ''
                          : item.media?.first ?? '',
                      title: item.title ?? '',
                      content: item.content ?? '',
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
